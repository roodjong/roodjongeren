"use strict";

/**
 *  petition-signature controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
    "api::petition-signature.petition-signature",
    ({ strapi }) => ({
        async add(ctx) {
            const { petitionId, name, email, questionAnswers } = ctx.request.body;
            if (!petitionId || !name || !email) {
                ctx.throw(400, "Missing parameters");
                return;
            }
            // Frontend posts the petition's public id, which is the v5
            // documentId (string) once the v4 response-shape shim exposes it
            // as `id` to consumers.
            const petition = await strapi
                .documents("api::petition.petition")
                .findOne({ documentId: petitionId });
            if (!petition) {
                ctx.throw(404, "Petition not found");
                return;
            }

            const petitionSignature = await strapi
                .service("api::petition-signature.petition-signature")
                .generateSignature(petition, name, email, questionAnswers);
            const result = await strapi
                .service("api::petition-signature.petition-signature")
                .create({ data: petitionSignature });
            if (!result) {
                ctx.throw(500, "Error generating signature");
                return;
            }

            const signatureCount = await strapi
                .documents("api::petition-signature.petition-signature")
                .count({
                    filters: {
                        petition: { documentId: petition.documentId },
                        email: { $eq: email },
                    },
                });

            if (signatureCount > 1) {
                await strapi
                    .documents("api::petition-signature.petition-signature")
                    .delete({
                        documentId: result.documentId,
                    });
                ctx.send({ existed: true });
                return;
            }

            await strapi
                .service("api::petition-signature.petition-signature")
                .sendConfirmationEmail(email, petitionSignature);

            ctx.send({ existed: false });
        },

        async confirm(ctx) {
            const { confirmationCode } = ctx.params;

            if (!confirmationCode) {
                ctx.throw(403, "Missing parameters");
                return;
            }

            const [signature] = await strapi
                .documents("api::petition-signature.petition-signature")
                .findMany({
                    filters: { confirmationCode },
                    populate: ["petition"],
                    limit: 1,
                });
            if (!signature) {
                ctx.throw(404, "Deze code kon niet gevonden worden");
                return;
            }
            await strapi.documents("api::petition-signature.petition-signature").update({
                documentId: signature.documentId,
                data: { confirmed: true },
            });
            if (!signature.petition) {
                // Orphaned signature — confirmation succeeded, but we cannot
                // redirect anywhere meaningful. Send back to the homepage.
                return ctx.redirect("/");
            }
            const [post] = await strapi.documents("api::post.post").findMany({
                filters: { petition: { documentId: signature.petition.documentId } },
                fields: ["slug"],
                limit: 1,
            });
            if (!post) {
                return ctx.redirect("/");
            }
            ctx.redirect(`/petitie/${post.slug}#thanks`);
        },
    })
);
