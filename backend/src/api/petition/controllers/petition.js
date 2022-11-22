"use strict";

/**
 *  petition controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::petition.petition",
  ({ strapi }) => ({
    async findOne(ctx) {
      const { id } = ctx.params;
      const { populate } = ctx.query;

      const response = await strapi
        .query("api::petition.petition")
        .findOne({ where: { id }, populate });

      const count = await strapi.entityService.count(
        "api::petition-signature.petition-signature",
        { filters: { petition: response.id, confirmed: true } }
      );
      return { signatureCount: count, ...response };
    },
  })
);
