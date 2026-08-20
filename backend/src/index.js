"use strict";

module.exports = {
    /**
     * An asynchronous register function that runs before
     * your application is initialized.
     *
     * This gives you an opportunity to extend code.
     */
    register(/*{ strapi }*/) {},

    /**
     * An asynchronous bootstrap function that runs before
     * your application gets started.
     *
     * This gives you an opportunity to set up your data model,
     * run jobs, or perform some special logic.
     */
    async bootstrap({ strapi }) {
        const uid = "api::international.international";
        const role = await strapi.db
            .query("plugin::users-permissions.role")
            .findOne({ where: { type: "public" } });

        if (!role) return;

        const actions = [`${uid}.find`, `${uid}.findOne`];

        for (const action of actions) {
            const existing = await strapi.db
                .query("plugin::users-permissions.permission")
                .findOne({ where: { action, role: role.id } });

            if (!existing) {
                await strapi.db.query("plugin::users-permissions.permission").create({
                    data: {
                        action,
                        role: role.id,
                    },
                });
            }
        }
    },
};
