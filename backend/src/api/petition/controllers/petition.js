"use strict";

/**
 *  petition controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::petition.petition", ({ strapi }) => ({
    async findOne(ctx) {
        // Strapi 5 default core router exposes :documentId. Older clients (and
        // the v4 response shim) may still call /api/petitions/:id with the
        // documentId routed through the legacy `id` param name, so accept both.
        const documentId = ctx.params.documentId ?? ctx.params.id;
        const { populate } = ctx.query;

        const response = await strapi
            .documents("api::petition.petition")
            .findOne({ documentId, populate });

        if (!response) {
            return ctx.notFound();
        }

        const count = await strapi
            .documents("api::petition-signature.petition-signature")
            .count({
                filters: {
                    petition: { documentId: response.documentId },
                    confirmed: true,
                },
            });

        // Mirror the v4-shim convention: expose `documentId` as the `id` field
        // so the frontend's `petition.id` keeps working as the public
        // identifier post-upgrade. Without this, the frontend posts the
        // numeric internal id back to /petition-signatures, which then looks
        // up by documentId and 404s.
        const { id: _internalId, documentId: responseDocId, ...rest } = response;
        return {
            signatureCount: count,
            id: responseDocId,
            documentId: responseDocId,
            ...rest,
        };
    },
}));
