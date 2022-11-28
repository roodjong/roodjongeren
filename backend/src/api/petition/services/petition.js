'use strict';

/**
 * petition service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::petition.petition');
