"use strict";

/**
 * Strapi test harness placeholder.
 *
 * The integration tests in `tests/petition-signature.flow.test.js` import
 * `createTestApp` from this module. When the harness is wired up (roadmap
 * TE2), this file should expose:
 *
 *   - createTestApp(): boots a Strapi instance via the programmatic API
 *     against an in-memory `better-sqlite3` database, runs migrations,
 *     returns `{ app, request, db, close }`.
 *   - seedPetition({...}): inserts a minimal petition row and returns it
 *     with its `documentId`.
 *   - seedSignature({...}): inserts a signature row tied to a petition.
 *
 * Suggested implementation references:
 *   - https://docs.strapi.io/dev-docs/testing
 *   - `@strapi/strapi` `createStrapi` programmatic API.
 *   - `supertest(app.server.httpServer)` for request assertions.
 */

module.exports = {
    createTestApp() {
        throw new Error(
            "Strapi test harness not implemented yet. See backend/tests/harness/strapi.js"
        );
    },
};
