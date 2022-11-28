"use strict";

/**
 * confidant service.
 */

const { createCoreService } = require("@strapi/strapi").factories;

module.exports = createCoreService("api::confidant.confidant");
