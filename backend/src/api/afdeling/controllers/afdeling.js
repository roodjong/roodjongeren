'use strict';

/**
 *  afdeling controller
 */

const {createCoreController} = require('@strapi/strapi').factories;
const {sanitize} = require('@strapi/utils');

module.exports = createCoreController('api::afdeling.afdeling', ({strapi}) => ({

  async find(ctx) {
    const {results, pagination} = await strapi.service('api::afdeling.afdeling').find({
      ...ctx.query,
      populate: {
        ...ctx.query.populate,
        contactpersoon: {
          fields: ['firstname', 'lastname', 'phone'],
        }
      }
    });
    const response = this.transformResponse(results, {pagination})
    response.data.forEach(sanitiseContactpersoon);
    return response;
  },

  async findOne(ctx) {
    const result = await strapi.service('api::afdeling.afdeling').findOne(ctx.params.id, {
      ...ctx.query,
      populate: {
        ...ctx.query.populate,
        contactpersoon: {
          fields: ['firstname', 'lastname', 'phone']
        }
      }
    });
    const response = this.transformResponse(result);
    sanitiseContactpersoon(response.data);
    return response;
  }
}));

function sanitiseContactpersoon(afdeling) {
  let contactpersoon = afdeling.attributes.contactpersoon.data;
  if (contactpersoon) {
    contactpersoon = {
      firstname: contactpersoon.attributes.firstname,
      lastname: contactpersoon.attributes.lastname,
      phone: contactpersoon.attributes.phone
    }
  }
  afdeling.attributes.contactpersoon = contactpersoon;
}
