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
                // Strapi 5 documents API links relations by documentId, not
                // the numeric id. Passing `petition.id` here would create an
                // orphaned signature with no FK to the petition row.
                petition: petition.documentId,
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

            await strapi
                .plugin("email")
                .service("email")
                .send({
                    to: email,
                    subject: "Verifieer je email om deze petitie te ondertekenen",
                    text: `Ga naar deze link om je mail te verifieren: ${confirmUrl}`,
                    html: `Klik hier om je mail te verifieren: <a href="${confirmUrl}">Verifieer email</a>`,
                });
        },
    })
);
