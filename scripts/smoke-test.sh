#!/usr/bin/env bash
# Smoke-test the Strapi public REST API by hitting a list of endpoints and
# recording each response as a JSON snapshot. Run once against the Strapi 4
# backend on `main`, once against the Strapi 5 backend with the
# v4-response-shape shim (PR #378) enabled, and `diff` the resulting
# directories. The two snapshots should be identical (modulo timestamps and
# `documentId`); any divergence is a regression in the shim or the upgrade.
#
# Usage:
#   scripts/smoke-test.sh <output-dir> [base-url]
#
# Example:
#   scripts/smoke-test.sh snapshots/v4 http://localhost/backend
#   git checkout strapi-v5/backend-upgrade
#   scripts/smoke-test.sh snapshots/v5 http://localhost/backend
#   diff -ruN snapshots/v4 snapshots/v5
#
# Caveat — Strapi 5 query-string compatibility:
# This script uses v4-style query strings (e.g. `populate[banner][fields][0]=url`).
# Strapi 5's REST query language is mostly backward-compatible but not 100%.
# If a diff looks like a shape regression, first verify it isn't a query
# semantics difference before blaming the response-shape middleware.

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "usage: $0 <output-dir> [base-url]" >&2
    exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
    echo "error: jq is required (brew install jq / apt install jq)" >&2
    exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
    echo "error: curl is required" >&2
    exit 1
fi

OUT_DIR=$1
BASE_URL=${2:-http://localhost/backend}

# Fixture slugs are read from env vars so the script works against any seed
# dataset. Override when running locally if these slugs don't exist:
#   AFDELING_SLUG=amsterdam POST_SLUG=woonprotest scripts/smoke-test.sh ...
AFDELING_SLUG=${AFDELING_SLUG:-amsterdam}
POST_SLUG=${POST_SLUG:-woonprotest}

mkdir -p "$OUT_DIR"

# Each line: <filename>|<path-with-query>
ENDPOINTS=(
    "fallback|/api/fallback?populate[pageBanner][fields][0]=url"
    "home|/api/home?populate[banner][fields][0]=url"
    "about-us|/api/about-us?populate[banner][fields][0]=url"
    "program|/api/program?populate[banner][fields][0]=url"
    "join-us|/api/join-us?populate[banner][fields][0]=url"
    "privacybeleid|/api/privacybeleid"
    "confidants-page|/api/confidants-page?populate[banner][fields][0]=url"
    "workgroups-page|/api/workgroups-page?populate[banner][fields][0]=url"
    "boardmembers|/api/boardmembers?sort=order&populate[photo][fields][0]=url"
    "confidants|/api/confidants?sort=name&populate[photo][fields][0]=url"
    "workgroups|/api/workgroups?sort=name"
    "afdelingen|/api/afdelingen?sort=name"
    "afdeling-by-slug|/api/afdelingen?filters[slug][\$eq]=${AFDELING_SLUG}&populate[banner][fields]=*"
    "posts|/api/posts?sort=publishedAt:desc&pagination[pageSize]=3&populate[banner][fields][0]=formats"
    "post-slugs|/api/posts?sort=publishedAt:desc&fields=slug"
    "post-by-slug|/api/posts?filters[slug][\$eq]=${POST_SLUG}&populate[banner][fields][0]=url&populate[afdeling]=true&populate[petition]=true"
)

# Endpoints whose body we expect NOT to be a success envelope, but where the
# snapshot is still meaningful — e.g. error responses go through the
# middleware's pass-through branch and we want to lock that in.
NONFAILING_ENDPOINTS=(
    "confirm-invalid|/api/petition-signatures/confirm/this-code-does-not-exist"
)

# Keys scrubbed recursively from snapshots so diffs aren't drowned in noise.
# Anywhere these keys appear (top-level, nested attributes, components,
# media), the value is replaced with "<REDACTED>". The `walk` filter matches
# by key name regardless of path, which is what we want: e.g. `documentId`
# inside a nested relation should also be scrubbed.
SCRUB_KEYS=(updatedAt createdAt publishedAt documentId)

scrub() {
    local file=$1
    local keys_json
    keys_json=$(printf '%s\n' "${SCRUB_KEYS[@]}" | jq -R . | jq -s .)
    local tmp
    tmp=$(mktemp)
    jq --argjson keys "$keys_json" '
        def redact($keys):
            walk(
                if type == "object" then
                    with_entries(
                        if (.key | IN($keys[])) then .value = "<REDACTED>"
                        else . end
                    )
                else . end
            );
        redact($keys)
    ' "$file" > "$tmp"
    mv "$tmp" "$file"
}

fail=0

snapshot() {
    local name=$1
    local path=$2
    local mode=$3   # "fail" or "keep"
    local url="${BASE_URL}${path}"
    local out="${OUT_DIR}/${name}.json"

    printf '%-22s GET %s\n' "$name" "$url"

    # `-g` disables curl's URL-globbing so `[` and `]` (used in Strapi v4
    # query syntax, e.g. `populate[banner][fields][0]=url`) are sent
    # literally instead of being treated as a range expression.
    local curl_flags=(-sS -g -H "Accept: application/json")
    if [[ $mode == "fail" ]]; then
        curl_flags+=(-f)
    fi

    if ! curl "${curl_flags[@]}" "$url" | jq -S . > "$out"; then
        echo "  FAILED" >&2
        fail=1
        return
    fi
    scrub "$out"
}

for entry in "${ENDPOINTS[@]}"; do
    snapshot "${entry%%|*}" "${entry#*|}" "fail"
done

for entry in "${NONFAILING_ENDPOINTS[@]}"; do
    snapshot "${entry%%|*}" "${entry#*|}" "keep"
done

echo
echo "Snapshots written to $OUT_DIR"
[[ $fail -eq 0 ]] || exit 1
