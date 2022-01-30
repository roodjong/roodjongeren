'use strict';

/**
 * support-us service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::support-us.support-us');
