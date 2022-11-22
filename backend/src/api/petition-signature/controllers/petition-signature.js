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
      const petition = await strapi
        .query("api::petition.petition")
        .findOne({ where: { id: { $eq: petitionId } } });
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

      const signatureCount = await strapi.entityService.count(
        "api::petition-signature.petition-signature",
        {
          filters: {
            petition: petitionId,
            email: { $eq: email },
          },
        }
      );

      if (signatureCount > 1) {
        await strapi.entityService.delete(
          "api::petition-signature.petition-signature",
          result.id
        );
        ctx.send({ existed: true });
        return;
      }

      await strapi.plugins["email"].services.email.send({
        to: email,
        subject: "Verifieer je email om deze petitie te ondertekenen",
        text: `Klik op deze link om je mail te verifieren: ${petitionSignature.confirmationCode}`,
        html: `Klik hier om je mail te verifieren: <a href="http://roodjongeren.nl/backend/api/petition-signatures/confirm/${petitionSignature.confirmationCode}">Verifieer email</a>`,
      });

      ctx.send({ existed: false });
    },

    async confirm(ctx) {
      const { confirmationCode } = ctx.params;

      if (!confirmationCode) {
        ctx.throw(403, "Missing parameters");
        return;
      }

      const signature = await strapi.db
        .query("api::petition-signature.petition-signature")
        .findOne({
          where: { confirmationCode },
          populate: true,
        });
      if (!signature) {
        ctx.throw(404, "Deze code kon niet gevonden worden");
        return;
      }
      await strapi.entityService.update(
        "api::petition-signature.petition-signature",
        signature.id,
        { data: { confirmed: true } }
      );
      ctx.redirect(`/petities/${signature.petition.slug}#thanks`);
    },
  })
);
