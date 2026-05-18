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

        return { signatureCount: count, ...response };
    },
}));
