"use strict";

/**
 * Integration test scaffold for the petition signature flow.
 *
 * Boots a real Strapi instance against an in-memory SQLite database, seeds a
 * minimal petition, and exercises the public REST endpoints used by the
 * frontend petition form:
 *
 *   POST /api/petition-signatures        (controller `add`)
 *   GET  /api/petition-signatures/confirm/:confirmationCode
 *   GET  /api/petitions/:documentId       (custom override with signatureCount)
 *
 * Currently marked `skip` because spinning up Strapi from a Node test runner
 * requires the harness in `tests/harness/strapi.js`. This file documents the
 * intended cases so the integration harness can be wired up later as a
 * separate change without redesigning the test set.
 *
 * SQLite vs Postgres caveat: production runs on Postgres; tests will likely
 * run on `better-sqlite3` for speed. Behaviour can diverge on (a) JSON
 * columns (`questionAnswers`), (b) case-sensitivity in `$eq` filters, and
 * (c) transaction isolation. If a test passes here but the same scenario
 * fails in prod, suspect divergence in one of those three first.
 */

const { test } = require("node:test");
// eslint-disable-next-line no-unused-vars -- consumed once tests are wired
const { createTestApp } = require("./harness/strapi.js");

// ---------------------------------------------------------------------------
// POST /api/petition-signatures
// ---------------------------------------------------------------------------

test.skip("POST /api/petition-signatures rejects when required fields are missing", () => {
    // Expect: 400, body { error: { message: "Missing parameters" } }
});

test.skip("POST /api/petition-signatures rejects unknown petition id", () => {
    // POST with a syntactically valid but unseeded documentId.
    // Expect: 404, body { error: { message: "Petition not found" } }
});

test.skip("POST /api/petition-signatures stores a signature for a valid petition", () => {
    // Seed a petition. POST with valid name + email + petitionId (documentId).
    // Expect: 200, body { existed: false }
    // Verify: one petition-signature row exists with confirmed=false and a
    // non-empty confirmationCode.
});

test.skip("POST /api/petition-signatures links the signature to the petition by FK", () => {
    // Regression guard: the v5 documents API links relations by documentId,
    // not numeric id (see fix in petition-signature.service.generateSignature).
    // Seed a petition, POST one signature, then SELECT the signature row and
    // assert its FK column (petition_id) matches the seeded petition row.
    // Catches the orphaned-signature bug class.
});

test.skip("POST /api/petition-signatures returns existed:true on duplicate email", () => {
    // Seed petition. POST once -> { existed: false }.
    // POST again with the same email -> { existed: true }.
    // Verify: the deduped second signature was deleted (count == 1).
});

// ---------------------------------------------------------------------------
// GET /api/petition-signatures/confirm/:code
// ---------------------------------------------------------------------------

test.skip("GET /api/petition-signatures/confirm/:code marks the signature confirmed", () => {
    // Seed petition + signature with confirmationCode = "ABC".
    // GET /confirm/ABC -> 302 redirect to /petitie/<slug>#thanks.
    // Verify: signature row now has confirmed=true.
});

test.skip("GET /api/petition-signatures/confirm/:code returns 404 for unknown code", () => {
    // GET /confirm/does-not-exist -> 404.
});

test.skip("GET /api/petition-signatures/confirm/:code redirects to / for orphan signatures", () => {
    // Regression guard: a signature whose petition row was deleted must not
    // crash on `signature.petition.documentId` deref. Seed a signature, delete
    // the petition row directly, then GET /confirm/<code>.
    // Expect: 302 redirect to "/" (not 500).
});

// ---------------------------------------------------------------------------
// GET /api/petitions/:documentId (custom controller override)
// ---------------------------------------------------------------------------

test.skip("GET /api/petitions/:documentId returns the petition with signatureCount", () => {
    // Seed petition + 3 confirmed + 2 unconfirmed signatures.
    // GET /api/petitions/<documentId> -> 200.
    //
    // Response shape: this controller bypasses both the standard v5 envelope
    // AND the v4 response-shape shim. Body is FLAT:
    //   { signatureCount: 3, id, documentId, title, ... }
    // Assert `body.signatureCount`, NOT `body.data.attributes.signatureCount`.
    //
    // Only confirmed signatures count (the 2 unconfirmed do not).
});

test.skip("GET /api/petitions/:documentId only counts the requested petition's signatures", () => {
    // Regression guard: the count filter must scope by documentId, not by
    // numeric id (see fix in petition.controller.findOne). Seed two petitions
    // with different signature counts (P1: 3 confirmed, P2: 5 confirmed),
    // GET /api/petitions/<P1.documentId>, assert body.signatureCount === 3.
    // Catches the "relation filter returns wrong count" bug class.
});
