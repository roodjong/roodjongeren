"use strict";

/**
 * fallback service.
 */

const { createCoreService } = require("@strapi/strapi").factories;

module.exports = createCoreService("api::fallback.fallback");
