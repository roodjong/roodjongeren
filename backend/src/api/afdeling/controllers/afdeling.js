'use strict';

/**
 *  afdeling controller
 */

const {createCoreController} = require('@strapi/strapi').factories;

module.exports = createCoreController('api::afdeling.afdeling', ({strapi}) => ({

  async find(ctx) {
    const {results, pagination} = await strapi.service('api::afdeling.afdeling').find({
      ...ctx.query,
      populate: {
        ...ctx.query.populate,
        contactpersonen: {
          fields: ['firstname', 'lastname', 'phone']
        }
      }
    });
    const response = this.transformResponse(results, {pagination})
    response.data.forEach(sanitiseContactpersonen);
    return response;
  },

  async findOne(ctx) {
    const result = await strapi.service('api::afdeling.afdeling').findOne(ctx.params.id, {
      ...ctx.query,
      populate: {
        ...ctx.query.populate,
        contactpersonen: {
          fields: ['firstname', 'lastname', 'phone']
        }
      }
    });
    const response = this.transformResponse(result);
    sanitiseContactpersonen(response.data);
    return response;
  }
}));

function sanitiseContactpersonen(afdeling) {
  afdeling.attributes.contactpersonen = afdeling.attributes.contactpersonen.data.map(it => {
    return {
      firstname: it.attributes.firstname,
      lastname: it.attributes.lastname,
      phone: it.attributes.phone
    };
  });
}
