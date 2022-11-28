"use strict";

/**
 * petition-signature service.
 */

const { createCoreService } = require("@strapi/strapi").factories;
const cryptoRandomStringPromise = import("crypto-random-string");
const path = require("path");

function joinPaths(...args) {
  return path.posix.join(...args).replace(":/", "://");
}

module.exports = createCoreService(
  "api::petition-signature.petition-signature",
  ({ strapi }) => ({
    async generateSignature(petition, name, email, questionAnswers) {
      const { cryptoRandomStringAsync } = await cryptoRandomStringPromise;

      const confirmationCode = await cryptoRandomStringAsync({
        length: 20,
        type: "alphanumeric",
      });
      return {
        petition: petition.id,
        name: name,
        email: email,
        confirmationCode,
        questionAnswers,
        confirmed: false,
      };
    },
    async sendConfirmationEmail(email, petitionSignature) {
      const serverUrl = strapi.config.get(
        "server.url",
        "https://roodjongeren.nl/backend"
      );
      const confirmUrl = joinPaths(
        serverUrl,
        `/api/petition-signatures/confirm/${petitionSignature.confirmationCode}`
      );

      await strapi.plugins["email"].services.email.send({
        to: email,
        subject: "Verifieer je email om deze petitie te ondertekenen",
        text: `Ga naar deze link om je mail te verifieren: ${confirmUrl}`,
        html: `Klik hier om je mail te verifieren: <a href="${confirmUrl}">Verifieer email</a>`,
      });
    },
  })
);
