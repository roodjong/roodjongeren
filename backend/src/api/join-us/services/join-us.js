"use strict";

/**
 * join-us service.
 */

const { createCoreService } = require("@strapi/strapi").factories;

module.exports = createCoreService("api::join-us.join-us");
