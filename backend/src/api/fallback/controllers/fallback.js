"use strict";

/**
 *  fallback controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::fallback.fallback");
