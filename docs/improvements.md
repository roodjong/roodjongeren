# Roodjongeren — improvement backlog & roadmap

A consolidated list of things we can improve across the repo, plus a proposed grouping into small reviewable PRs.

The list was produced by a full walk through `main` after the Strapi 4 → 5 migration PRs were opened. Items are tagged by **impact** (🔴 high / 🟡 medium / 🟢 nice-to-have) and **effort** (S / M / L).

> Use this doc as a working backlog. Cross items off as PRs land. Items that grow scope into their own initiative get split out into a separate doc next to this one.

---

## Table of contents

1. [Inventory of improvements](#1-inventory-of-improvements)
2. [Proposed PR roadmap](#2-proposed-pr-roadmap)
3. [Dependencies and sequencing](#3-dependencies-and-sequencing)
4. [Out of scope for this roadmap](#4-out-of-scope-for-this-roadmap)

---

## 1. Inventory of improvements

### Tooling & developer experience

| # | Impact / Effort | Item |
|---|---|---|
| T1 | 🔴 S | Migrate ESLint + Prettier → **Biome**. Single fast Rust binary, kills the `@eslint/config-array: "*"` hack we need today to bridge ESLint 9 flat-config and `eslint-config-next` legacy-config. `next lint` is also deprecated in Next 16. |
| T2 | 🔴 S | Pin Node + yarn at the repo level. Add `.tool-versions` and `"packageManager"` in each `package.json`. Current `engines.node: ">=12 <=20"` is so loose it caused install drift during the migration. |
| T3 | 🟡 S | Husky + lint-staged pre-commit hook running Biome on staged files only. |
| T4 | 🟡 S | Yarn / pnpm workspace at the repo root, so "format both apps" is one command and lockfiles dedupe. |
| T5 | 🟡 M | Bun for frontend dev scripts and tests (not prod runtime — Next 15 Bun support is still experimental, Strapi explicitly tests on Node only). |
| T6 | 🟡 S | Consolidate Tailwind versions. `frontend/package.json` mixes `tailwindcss: "3"` and `@tailwindcss/postcss: "^4.1.12"`, which don't go together. |
| T7 | 🟡 S | Drop `next-transpile-modules` — built into Next 13+, package is deprecated. |
| T8 | 🟢 S | Add `actions/checkout@v4` (currently `@v3`) and a `github-actions` entry in `dependabot.yml` so this stays current automatically. |

### TypeScript strictness

| # | Impact / Effort | Item |
|---|---|---|
| TS1 | 🔴 M | Eliminate the **21 `any` casts** in `frontend/src` (most in `utils/backend.ts`, introduced or preserved by PR #377 to keep that PR small). Replace with proper Strapi response types once #380 lands. |
| TS2 | 🔴 S | Enable `noUncheckedIndexedAccess`, `exactOptionalPropertyTypes`, `noFallthroughCasesInSwitch`, `noImplicitOverride`. The first one alone would have caught the `response.data.data[0].attributes` crashes I had to add error throws for. |
| TS3 | 🟡 S | Bump `frontend/tsconfig.json#target` from `es5` → `es2022`. Next 15 transpiles down anyway; modern target = smaller dev bundles. |
| TS4 | 🟡 S | Add `@total-typescript/ts-reset` for safer built-ins (`JSON.parse(): unknown`, `Array.filter(Boolean)` narrowing nullables). |

### Testing

| # | Impact / Effort | Item |
|---|---|---|
| TE1 | 🔴 M | Adopt **TDD for new backend custom code**. Concrete rule: no merging a new custom controller without a paired test. |
| TE2 | 🔴 M | Wire up the 7 skipped petition-flow stubs in PR #381 with `@strapi/strapi` programmatic API + `better-sqlite3`. Without this, the most business-critical flow has zero automated coverage. |
| TE3 | 🔴 M | **Vitest + React Testing Library** on the frontend. No test infra exists today. Start with `strapi-response.ts` (pure) and `PetitionFormBox.tsx` (stateful). |
| TE4 | 🟡 L | **Playwright e2e** for the petition signature flow (submit → email → confirm → redirect). Currently only tested by clicking through manually. |
| TE5 | 🟡 S | Coverage gate in CI — fail under e.g. 60% on touched files. |

### Backend architecture (Strapi)

| # | Impact / Effort | Item |
|---|---|---|
| B1 | 🔴 M | **Move custom business logic out of controllers into services** (MVC, Strapi-style). `petition-signature/controllers/petition-signature.js#add` does request parsing + DB lookups + dedup counting + deletion + email sending + response shaping — 50 lines in one method. |
| B2 | 🔴 S | **Wrap petition signature create + dedup count in a DB transaction.** Current flow: create → count → if count>1, delete. Race condition: two simultaneous submits both see `count==1` and both succeed. |
| B3 | 🔴 S | **Switch `/api/petition-signatures/confirm/:code` from GET to POST.** Email previewers (Outlook, Gmail link checkers, antivirus URL scanners) will fire that GET and silently confirm every signature before the user clicks. |
| B4 | 🔴 S | **Rate-limit the petition endpoints.** Zero rate limiting today; a bot can sign 10k times. |
| B5 | 🔴 S | **CAPTCHA / Cloudflare Turnstile on the petition form.** Email-confirmation alone doesn't stop bots with throwaway inboxes. |
| B6 | 🟡 S | **Replace `strapi.db.query` with `strapi.documents()`** in custom controllers. The low-level query bypasses Strapi authorization and is brittle across versions. (Do this after #380 lands.) |
| B7 | 🟡 S | **Validate inputs with Zod** (or Strapi 5 policies). Today the petition `add` controller does `if (!petitionId || !name || !email)` and trusts the rest. No format validation, no length cap, no schema for `questionAnswers`. |
| B8 | 🟡 S | **Queue email sends** instead of awaiting in the request path. A slow SMTP timeout makes the user see a 30-second spinner. |

### Frontend architecture (Next.js)

| # | Impact / Effort | Item |
|---|---|---|
| F1 | 🔴 M | **Migrate from Pages Router to App Router.** Server components, streaming, parallel routes. Vercel is consolidating everything on App Router. |
| F2 | 🔴 M | **Split `frontend/src/utils/backend.ts`** (459 lines, 22 fetchers) into per-domain files: `lib/posts.ts`, `lib/petitions.ts`, `lib/afdelingen.ts`, `lib/pages.ts`. |
| F3 | 🟡 M | **TanStack Query** (Pages Router) or **fetch + Next.js cache** (App Router after F1). Today every page does its own SSR fetch with no client cache, no dedup, no invalidation. |
| F4 | 🟡 S | **Fix the `Fallback.pageBanner: string` type lie** across 6 page files. Runtime is nullable. |
| F5 | 🟡 M | **i18n with `next-intl`.** Even shipping Dutch-only, an i18n layer removes hardcoded copy from JSX and makes the eventual English version free. |
| F6 | 🟡 S | **Structured data (JSON-LD) + sitemap.xml + RSS.** Today: none. `app/sitemap.ts` gives you sitemap for free. |
| F7 | 🟡 S | **Accessibility audit.** No `aria-*` attributes in components I scanned. WCAG matters legally for petition forms in NL/EU. |
| F8 | 🟢 S | **Unify language of page filenames.** `afdelingen.tsx` (Dutch) sits next to `posts.tsx` (English). |

### Infrastructure & ops

| # | Impact / Effort | Item |
|---|---|---|
| I1 | 🔴 M | **Stand up a staging environment.** Even a tiny second VM running the same compose file gives a pre-prod cutover test for #380 and every future deploy. |
| I2 | 🔴 S | **Move prod secrets out of `.env` files in the repo / on the server.** 1Password Connect, Doppler, or AWS SSM Parameter Store. Dev creds being checked in is acceptable; prod creds in `docker/roodjongeren_prod/.env` are not. |
| I3 | 🔴 M | **Add Sentry to backend + frontend.** Today: zero error tracking. SMTP misconfig in `sendConfirmationEmail` would only surface from angry users days later. |
| I4 | 🟡 M | **Automate DB snapshots.** Cron `pg_dump | gzip | aws s3 cp` on the host with rotation, not the manual step the README documents today. |
| I5 | 🟡 M | **CI/CD deploy.** Replace "SSH in, `git pull`, `docker compose up --build`" with GitHub Actions → image registry → host pull. |
| I6 | 🟡 S | **Healthchecks** on docker-compose services + a `/api/health` endpoint on Strapi. |
| I7 | 🟡 S | **Uptime monitoring** (UptimeRobot / BetterUptime). One ping/min against `https://roodjongeren.nl/api/home`. Free tier. |

### CI

| # | Impact / Effort | Item |
|---|---|---|
| C1 | 🔴 S | **Backend test CI job.** After #378 lands the test infra exists; add a step running `cd backend && yarn test`. |
| C2 | 🔴 S | **Backend build CI job** (`cd backend && yarn build`). Catches Strapi config + schema errors before prod. |
| C3 | 🟡 S | **`.github/CODEOWNERS`** so PRs auto-request the right reviewer. |
| C4 | 🟡 S | **PR template** (`.github/pull_request_template.md`) with What / Why / Test / Rollback. |

### Code quality (small)

| # | Impact / Effort | Item |
|---|---|---|
| Q1 | 🟢 S | Prune unused frontend deps in `backend/package.json` (`react`, `react-dom`, `react-is`, `react-router-dom`, `styled-components`, `@types/react`) — most are transitive admin-internals after the Strapi 5 codemod. |

---

## 2. Proposed PR roadmap

Total: 18 PRs in 5 waves. Each PR is small, single-concern, and ships independently.

Waves can run in parallel across people; PRs *inside* a wave can also run in parallel unless noted.

### Wave 1 — Foundation (1–2 weeks)

Goal: stop the bleeding. Add the guardrails that make future PRs safer.

| PR | Title | Items |
|---|---|---|
| W1.1 | `chore: pin node and yarn versions, add ts-reset` | T2, TS4 |
| W1.2 | `ci: add backend test + build workflows, bump actions/checkout` | C1, C2, T8 |
| W1.3 | `chore: add PR template and CODEOWNERS` | C3, C4 |
| W1.4 | `feat(observability): add Sentry to backend and frontend` | I3 |

### Wave 2 — Tooling (1–2 weeks, in parallel with Wave 3)

Goal: lower per-PR friction by replacing the ESLint/Prettier stack and stricter TS flags.

| PR | Title | Items |
|---|---|---|
| W2.1 | `chore: migrate from ESLint+Prettier to Biome` | T1 |
| W2.2 | `chore: husky + lint-staged pre-commit hook` | T3 |
| W2.3 | `chore: consolidate Tailwind, drop next-transpile-modules, bump tsconfig target` | T6, T7, TS3 |
| W2.4 | `chore: enable stricter TS flags (noUncheckedIndexedAccess + friends)` | TS2 — large diff, expect ripple |
| W2.5 | `chore(frontend): set up Vitest with starter tests on strapi-response.ts` | TE3 |

### Wave 3 — Petition-flow hardening (urgent, do alongside Wave 2)

Goal: the petition endpoint is live and exposed to the public internet today. These three PRs close the immediate security & correctness gaps.

| PR | Title | Items |
|---|---|---|
| W3.1 | `feat(backend): wrap petition signature in DB transaction, validate input with Zod` | B2, B7 |
| W3.2 | `feat(backend): convert /confirm/:code from GET to POST` | B3 — touches email template |
| W3.3 | `feat(backend): rate-limit petition endpoints and add Turnstile to the form` | B4, B5 — paired, frontend + backend |

### Wave 4 — Post-Strapi-5 architecture cleanup (after #380 lands)

Goal: take advantage of Strapi 5 idioms, kill technical debt the upgrade exposed.

| PR | Title | Items |
|---|---|---|
| W4.1 | `refactor(backend): move petition business logic from controller to service (MVC)` | B1 |
| W4.2 | `refactor(backend): replace strapi.db.query with documents API in custom controllers` | B6 |
| W4.3 | `feat(backend): queue email sends out of request path` | B8 |
| W4.4 | `refactor(frontend): eliminate any-casts in backend.ts using Strapi 5 native types` | TS1 |
| W4.5 | `refactor(frontend): split backend.ts into per-domain modules` | F2 |
| W4.6 | `test(backend): implement petition-flow integration tests (wire up #381 stubs)` | TE2 |

### Wave 5 — Quality & polish (no time pressure)

Goal: SEO, accessibility, polish, the smaller fixes.

| PR | Title | Items |
|---|---|---|
| W5.1 | `fix(frontend): make Fallback.pageBanner properly nullable across consumers` | F4 |
| W5.2 | `chore: unify language of page filenames` | F8 |
| W5.3 | `feat(frontend): add sitemap, RSS feed, and JSON-LD structured data` | F6 |
| W5.4 | `feat(a11y): audit and fix top accessibility violations` | F7 |
| W5.5 | `chore(backend): prune unused frontend deps from backend/package.json` | Q1 |
| W5.6 | `test: add Playwright e2e for petition signature flow` | TE4, TE5 |

### Initiatives — too big to be one PR

These each get their own working doc + multi-PR plan, not a single line in this roadmap.

| Initiative | Items | Notes |
|---|---|---|
| **App Router migration** | F1 | One PR per page (`/`, `/posts`, `/posts/[slug]`, `/petitie/[slug]`, `/afdelingen`, `/afdelingen/[slug]`, etc.). 8–10 PRs over a quarter. Start with a low-traffic page as proof. |
| **Switch fetching to TanStack Query (or App-Router-native cache)** | F3 | Depends on whether F1 is in progress. If sticking with Pages Router → TanStack Query. If App Router → use built-in `fetch` + `revalidateTag`. |
| **i18n with next-intl** | F5 | Touches every component. Even if shipping Dutch-only, the refactor moves copy out of JSX. |
| **Staging environment** | I1 | Mostly server config, not a single PR. Likely a 1-pager runbook in `docs/` + a `docker/roodjongeren_staging/` directory. |
| **CI/CD deploy pipeline** | I5 | Depends on I1. Image registry choice (GHCR vs Docker Hub) + secrets management. |
| **Bun for frontend dev** | T5 | Wait until Next.js Bun support exits experimental. Revisit Q3/Q4 2026. |

---

## 3. Dependencies and sequencing

```
Wave 1 (foundation)
   ├── W1.1 ─┐
   ├── W1.2 ─┼─→ Wave 2 (tooling)        ─┐
   ├── W1.3 ─┘                            │
   └── W1.4 ──→ (independent)             │
                                          │
PR #380 (Strapi 5) ─→ Wave 4 (cleanup) ──┼─→ Wave 5 (polish)
                                          │
   Wave 3 (petition hardening) ───────────┘
   (can land in parallel with Wave 2)
```

Hard ordering:
- **Wave 4 requires PR #380 merged** (uses Strapi 5 documents API in W4.2 and v5 native types in W4.4).
- **W2.4 (stricter TS)** should land after W4.4 (eliminating `any`) — otherwise the flag enable cascades into the `any`-laden code.
- **W3.2 (GET → POST)** touches the email template; coordinate with whoever owns the email content.

Soft ordering:
- Do W1.1 + W1.2 first. They cost ~1 day and unblock everything.
- Wave 5 is fully parallelizable and can be cherry-picked any time.

---

## 4. Out of scope for this roadmap

These are listed in the inventory but deliberately *not* in the PR plan:

- **F1 App Router migration** — too big for one PR. Lives in its own initiative doc when started.
- **T5 Bun migration** — waiting on Next.js Bun support to exit experimental.
- **I1 Staging** + **I5 CI/CD** — infra projects with their own runbook.
- **I7 Uptime monitoring** + **I4 DB snapshots** — operational, mostly external service setup, not repo changes.
