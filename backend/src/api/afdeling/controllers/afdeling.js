"use strict";

/**
 *  afdeling controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::afdeling.afdeling", ({ strapi }) => ({
    async find(ctx) {
        const { results, pagination } = await strapi
            .service("api::afdeling.afdeling")
            .find({
                ...ctx.query,
                populate: {
                    ...ctx.query.populate,
                    contactpersonen: {
                        fields: ["firstname", "lastname", "phone"],
                    },
                },
            });
        results.forEach(sanitiseContactpersonen);
        return { data: results, meta: { pagination } };
    },

    async findOne(ctx) {
        const result = await strapi
            .service("api::afdeling.afdeling")
            .findOne(ctx.params.id, {
                ...ctx.query,
                populate: {
                    ...ctx.query.populate,
                    contactpersonen: {
                        fields: ["firstname", "lastname", "phone"],
                    },
                },
            });
        if (result) sanitiseContactpersonen(result);
        return { data: result, meta: {} };
    },
}));

function sanitiseContactpersonen(afdeling) {
    // In Strapi 5 the service returns relations inline as a flat array, not
    // wrapped as `{ data: [...] }`. The v4-response-shape middleware
    // re-wraps the response after this controller returns, so we strip down
    // to plain fields here and let the middleware do the final envelope
    // shaping.
    const contactpersonen = afdeling.contactpersonen ?? [];
    afdeling.contactpersonen = contactpersonen.map((it) => ({
        firstname: it.firstname,
        lastname: it.lastname,
        phone: it.phone,
    }));
}
