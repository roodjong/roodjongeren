"use strict";

/**
 * international service.
 */

const { createCoreService } = require("@strapi/strapi").factories;

module.exports = createCoreService("api::international.international");
