import type { Schema, Attribute } from "@strapi/strapi";

export interface AdminPermission extends Schema.CollectionType {
    collectionName: "admin_permissions";
    info: {
        name: "Permission";
        description: "";
        singularName: "permission";
        pluralName: "permissions";
        displayName: "Permission";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        action: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        actionParameters: Attribute.JSON & Attribute.DefaultTo<{}>;
        subject: Attribute.String &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        properties: Attribute.JSON & Attribute.DefaultTo<{}>;
        conditions: Attribute.JSON & Attribute.DefaultTo<[]>;
        role: Attribute.Relation<"admin::permission", "manyToOne", "admin::role">;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"admin::permission", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"admin::permission", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface AdminUser extends Schema.CollectionType {
    collectionName: "admin_users";
    info: {
        name: "User";
        description: "";
        singularName: "user";
        pluralName: "users";
        displayName: "User";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        firstname: Attribute.String &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        lastname: Attribute.String &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        username: Attribute.String;
        email: Attribute.Email &
            Attribute.Required &
            Attribute.Private &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                minLength: 6;
            }>;
        password: Attribute.Password &
            Attribute.Private &
            Attribute.SetMinMaxLength<{
                minLength: 6;
            }>;
        resetPasswordToken: Attribute.String & Attribute.Private;
        registrationToken: Attribute.String & Attribute.Private;
        isActive: Attribute.Boolean & Attribute.Private & Attribute.DefaultTo<false>;
        roles: Attribute.Relation<"admin::user", "manyToMany", "admin::role"> &
            Attribute.Private;
        blocked: Attribute.Boolean & Attribute.Private & Attribute.DefaultTo<false>;
        preferedLanguage: Attribute.String;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"admin::user", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"admin::user", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface AdminRole extends Schema.CollectionType {
    collectionName: "admin_roles";
    info: {
        name: "Role";
        description: "";
        singularName: "role";
        pluralName: "roles";
        displayName: "Role";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String &
            Attribute.Required &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        code: Attribute.String &
            Attribute.Required &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        description: Attribute.String;
        users: Attribute.Relation<"admin::role", "manyToMany", "admin::user">;
        permissions: Attribute.Relation<"admin::role", "oneToMany", "admin::permission">;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"admin::role", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"admin::role", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface AdminApiToken extends Schema.CollectionType {
    collectionName: "strapi_api_tokens";
    info: {
        name: "Api Token";
        singularName: "api-token";
        pluralName: "api-tokens";
        displayName: "Api Token";
        description: "";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String &
            Attribute.Required &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        description: Attribute.String &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }> &
            Attribute.DefaultTo<"">;
        type: Attribute.Enumeration<["read-only", "full-access", "custom"]> &
            Attribute.Required &
            Attribute.DefaultTo<"read-only">;
        accessKey: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        lastUsedAt: Attribute.DateTime;
        permissions: Attribute.Relation<
            "admin::api-token",
            "oneToMany",
            "admin::api-token-permission"
        >;
        expiresAt: Attribute.DateTime;
        lifespan: Attribute.BigInteger;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"admin::api-token", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"admin::api-token", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface AdminApiTokenPermission extends Schema.CollectionType {
    collectionName: "strapi_api_token_permissions";
    info: {
        name: "API Token Permission";
        description: "";
        singularName: "api-token-permission";
        pluralName: "api-token-permissions";
        displayName: "API Token Permission";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        action: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        token: Attribute.Relation<
            "admin::api-token-permission",
            "manyToOne",
            "admin::api-token"
        >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "admin::api-token-permission",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "admin::api-token-permission",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface AdminTransferToken extends Schema.CollectionType {
    collectionName: "strapi_transfer_tokens";
    info: {
        name: "Transfer Token";
        singularName: "transfer-token";
        pluralName: "transfer-tokens";
        displayName: "Transfer Token";
        description: "";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String &
            Attribute.Required &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        description: Attribute.String &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }> &
            Attribute.DefaultTo<"">;
        accessKey: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        lastUsedAt: Attribute.DateTime;
        permissions: Attribute.Relation<
            "admin::transfer-token",
            "oneToMany",
            "admin::transfer-token-permission"
        >;
        expiresAt: Attribute.DateTime;
        lifespan: Attribute.BigInteger;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "admin::transfer-token",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "admin::transfer-token",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface AdminTransferTokenPermission extends Schema.CollectionType {
    collectionName: "strapi_transfer_token_permissions";
    info: {
        name: "Transfer Token Permission";
        description: "";
        singularName: "transfer-token-permission";
        pluralName: "transfer-token-permissions";
        displayName: "Transfer Token Permission";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        action: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 1;
            }>;
        token: Attribute.Relation<
            "admin::transfer-token-permission",
            "manyToOne",
            "admin::transfer-token"
        >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "admin::transfer-token-permission",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "admin::transfer-token-permission",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface PluginUploadFile extends Schema.CollectionType {
    collectionName: "files";
    info: {
        singularName: "file";
        pluralName: "files";
        displayName: "File";
        description: "";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String & Attribute.Required;
        alternativeText: Attribute.String;
        caption: Attribute.String;
        width: Attribute.Integer;
        height: Attribute.Integer;
        formats: Attribute.JSON;
        hash: Attribute.String & Attribute.Required;
        ext: Attribute.String;
        mime: Attribute.String & Attribute.Required;
        size: Attribute.Decimal & Attribute.Required;
        url: Attribute.String & Attribute.Required;
        previewUrl: Attribute.String;
        provider: Attribute.String & Attribute.Required;
        provider_metadata: Attribute.JSON;
        related: Attribute.Relation<"plugin::upload.file", "morphToMany">;
        folder: Attribute.Relation<
            "plugin::upload.file",
            "manyToOne",
            "plugin::upload.folder"
        > &
            Attribute.Private;
        folderPath: Attribute.String &
            Attribute.Required &
            Attribute.Private &
            Attribute.SetMinMax<
                {
                    min: 1;
                },
                number
            >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"plugin::upload.file", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"plugin::upload.file", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface PluginUploadFolder extends Schema.CollectionType {
    collectionName: "upload_folders";
    info: {
        singularName: "folder";
        pluralName: "folders";
        displayName: "Folder";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMax<
                {
                    min: 1;
                },
                number
            >;
        pathId: Attribute.Integer & Attribute.Required & Attribute.Unique;
        parent: Attribute.Relation<
            "plugin::upload.folder",
            "manyToOne",
            "plugin::upload.folder"
        >;
        children: Attribute.Relation<
            "plugin::upload.folder",
            "oneToMany",
            "plugin::upload.folder"
        >;
        files: Attribute.Relation<
            "plugin::upload.folder",
            "oneToMany",
            "plugin::upload.file"
        >;
        path: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMax<
                {
                    min: 1;
                },
                number
            >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "plugin::upload.folder",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "plugin::upload.folder",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface PluginContentReleasesRelease extends Schema.CollectionType {
    collectionName: "strapi_releases";
    info: {
        singularName: "release";
        pluralName: "releases";
        displayName: "Release";
    };
    options: {
        draftAndPublish: false;
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String & Attribute.Required;
        releasedAt: Attribute.DateTime;
        scheduledAt: Attribute.DateTime;
        timezone: Attribute.String;
        status: Attribute.Enumeration<["ready", "blocked", "failed", "done", "empty"]> &
            Attribute.Required;
        actions: Attribute.Relation<
            "plugin::content-releases.release",
            "oneToMany",
            "plugin::content-releases.release-action"
        >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "plugin::content-releases.release",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "plugin::content-releases.release",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface PluginContentReleasesReleaseAction extends Schema.CollectionType {
    collectionName: "strapi_release_actions";
    info: {
        singularName: "release-action";
        pluralName: "release-actions";
        displayName: "Release Action";
    };
    options: {
        draftAndPublish: false;
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        type: Attribute.Enumeration<["publish", "unpublish"]> & Attribute.Required;
        entry: Attribute.Relation<
            "plugin::content-releases.release-action",
            "morphToOne"
        >;
        contentType: Attribute.String & Attribute.Required;
        locale: Attribute.String;
        release: Attribute.Relation<
            "plugin::content-releases.release-action",
            "manyToOne",
            "plugin::content-releases.release"
        >;
        isEntryValid: Attribute.Boolean;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "plugin::content-releases.release-action",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "plugin::content-releases.release-action",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface PluginI18NLocale extends Schema.CollectionType {
    collectionName: "i18n_locale";
    info: {
        singularName: "locale";
        pluralName: "locales";
        collectionName: "locales";
        displayName: "Locale";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String &
            Attribute.SetMinMax<
                {
                    min: 1;
                    max: 50;
                },
                number
            >;
        code: Attribute.String & Attribute.Unique;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"plugin::i18n.locale", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"plugin::i18n.locale", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface PluginUsersPermissionsPermission extends Schema.CollectionType {
    collectionName: "up_permissions";
    info: {
        name: "permission";
        description: "";
        singularName: "permission";
        pluralName: "permissions";
        displayName: "Permission";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        action: Attribute.String & Attribute.Required;
        role: Attribute.Relation<
            "plugin::users-permissions.permission",
            "manyToOne",
            "plugin::users-permissions.role"
        >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "plugin::users-permissions.permission",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "plugin::users-permissions.permission",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface PluginUsersPermissionsRole extends Schema.CollectionType {
    collectionName: "up_roles";
    info: {
        name: "role";
        description: "";
        singularName: "role";
        pluralName: "roles";
        displayName: "Role";
    };
    pluginOptions: {
        "content-manager": {
            visible: false;
        };
        "content-type-builder": {
            visible: false;
        };
    };
    attributes: {
        name: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 3;
            }>;
        description: Attribute.String;
        type: Attribute.String & Attribute.Unique;
        permissions: Attribute.Relation<
            "plugin::users-permissions.role",
            "oneToMany",
            "plugin::users-permissions.permission"
        >;
        users: Attribute.Relation<
            "plugin::users-permissions.role",
            "oneToMany",
            "plugin::users-permissions.user"
        >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "plugin::users-permissions.role",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "plugin::users-permissions.role",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface PluginUsersPermissionsUser extends Schema.CollectionType {
    collectionName: "up_users";
    info: {
        name: "user";
        description: "";
        singularName: "user";
        pluralName: "users";
        displayName: "User";
    };
    options: {
        draftAndPublish: false;
        timestamps: true;
    };
    attributes: {
        username: Attribute.String &
            Attribute.Required &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                minLength: 3;
            }>;
        email: Attribute.Email &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                minLength: 6;
            }>;
        provider: Attribute.String;
        password: Attribute.Password &
            Attribute.Private &
            Attribute.SetMinMaxLength<{
                minLength: 6;
            }>;
        resetPasswordToken: Attribute.String & Attribute.Private;
        confirmationToken: Attribute.String & Attribute.Private;
        confirmed: Attribute.Boolean & Attribute.DefaultTo<false>;
        blocked: Attribute.Boolean & Attribute.DefaultTo<false>;
        role: Attribute.Relation<
            "plugin::users-permissions.user",
            "manyToOne",
            "plugin::users-permissions.role"
        >;
        firstname: Attribute.String & Attribute.Required;
        lastname: Attribute.String & Attribute.Required;
        phone: Attribute.String;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "plugin::users-permissions.user",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "plugin::users-permissions.user",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiAboutUsAboutUs extends Schema.SingleType {
    collectionName: "about_uses";
    info: {
        singularName: "about-us";
        pluralName: "about-uses";
        displayName: "Over ons";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        content: Attribute.RichText & Attribute.Required;
        banner: Attribute.Media<"images"> & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::about-us.about-us",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::about-us.about-us",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiAfdelingAfdeling extends Schema.CollectionType {
    collectionName: "afdelingen";
    info: {
        singularName: "afdeling";
        pluralName: "afdelingen";
        displayName: "Afdeling";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        name: Attribute.String & Attribute.Required & Attribute.Unique;
        longitude: Attribute.Float & Attribute.Required;
        latitude: Attribute.Float & Attribute.Required;
        email: Attribute.Email & Attribute.Required;
        twitterLink: Attribute.String;
        facebookLink: Attribute.String;
        instagramLink: Attribute.String;
        contactpersonen: Attribute.Relation<
            "api::afdeling.afdeling",
            "oneToMany",
            "plugin::users-permissions.user"
        >;
        slug: Attribute.UID<"api::afdeling.afdeling", "name"> & Attribute.Required;
        posts: Attribute.Relation<
            "api::afdeling.afdeling",
            "oneToMany",
            "api::post.post"
        >;
        about: Attribute.RichText & Attribute.Required;
        banner: Attribute.Media<"images">;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::afdeling.afdeling",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::afdeling.afdeling",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiBoardmemberBoardmember extends Schema.CollectionType {
    collectionName: "boardmembers";
    info: {
        singularName: "boardmember";
        pluralName: "boardmembers";
        displayName: "Bestuurslid";
        description: "";
    };
    options: {
        draftAndPublish: true;
    };
    attributes: {
        name: Attribute.String & Attribute.Required;
        role: Attribute.String;
        email: Attribute.Email;
        extra: Attribute.RichText;
        photo: Attribute.Media<"images">;
        order: Attribute.Integer & Attribute.Required & Attribute.DefaultTo<10>;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        publishedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::boardmember.boardmember",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::boardmember.boardmember",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiConfidantConfidant extends Schema.CollectionType {
    collectionName: "confidants";
    info: {
        singularName: "confidant";
        pluralName: "confidants";
        displayName: "Vertrouwenspersonen";
        description: "";
    };
    options: {
        draftAndPublish: true;
    };
    attributes: {
        name: Attribute.String & Attribute.Required;
        email: Attribute.Email & Attribute.Required;
        phone: Attribute.String & Attribute.Required;
        photo: Attribute.Media<"images"> & Attribute.Required;
        about: Attribute.RichText & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        publishedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::confidant.confidant",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::confidant.confidant",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiConfidantsPageConfidantsPage extends Schema.SingleType {
    collectionName: "confidants_pages";
    info: {
        singularName: "confidants-page";
        pluralName: "confidants-pages";
        displayName: "Vertrouwenspersonen-pagina";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        content: Attribute.RichText & Attribute.Required;
        banner: Attribute.Media<"images"> & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::confidants-page.confidants-page",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::confidants-page.confidants-page",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiFallbackFallback extends Schema.SingleType {
    collectionName: "fallbacks";
    info: {
        singularName: "fallback";
        pluralName: "fallbacks";
        displayName: "Fallback";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        pageBanner: Attribute.Media<"images"> & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::fallback.fallback",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::fallback.fallback",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiHomeHome extends Schema.SingleType {
    collectionName: "homes";
    info: {
        singularName: "home";
        pluralName: "homes";
        displayName: "Home";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        banner: Attribute.Media<"images"> & Attribute.Required;
        bannerTitle: Attribute.String & Attribute.Required;
        bannerSubtitle: Attribute.String & Attribute.Required;
        shortAboutUs: Attribute.RichText & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"api::home.home", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"api::home.home", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface ApiJoinUsJoinUs extends Schema.SingleType {
    collectionName: "join_uses";
    info: {
        singularName: "join-us";
        pluralName: "join-uses";
        displayName: "Word lid";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        content: Attribute.RichText & Attribute.Required;
        banner: Attribute.Media<"images"> & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"api::join-us.join-us", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"api::join-us.join-us", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface ApiPetitionPetition extends Schema.CollectionType {
    collectionName: "petitions";
    info: {
        singularName: "petition";
        pluralName: "petitions";
        displayName: "Petitie";
        description: "";
    };
    options: {
        draftAndPublish: true;
    };
    attributes: {
        hook: Attribute.String;
        signatures: Attribute.Relation<
            "api::petition.petition",
            "oneToMany",
            "api::petition-signature.petition-signature"
        >;
        extraQuestions: Attribute.JSON;
        post: Attribute.Relation<"api::petition.petition", "oneToOne", "api::post.post">;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        publishedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::petition.petition",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::petition.petition",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiPetitionSignaturePetitionSignature extends Schema.CollectionType {
    collectionName: "petition_signatures";
    info: {
        singularName: "petition-signature";
        pluralName: "petition-signatures";
        displayName: "Petitie-ondertekening";
        description: "";
    };
    options: {
        draftAndPublish: false;
        comment: "";
    };
    attributes: {
        name: Attribute.String;
        email: Attribute.Email;
        confirmationCode: Attribute.String & Attribute.Private & Attribute.Unique;
        confirmed: Attribute.Boolean;
        petition: Attribute.Relation<
            "api::petition-signature.petition-signature",
            "manyToOne",
            "api::petition.petition"
        >;
        questionAnswers: Attribute.JSON;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::petition-signature.petition-signature",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::petition-signature.petition-signature",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiPostPost extends Schema.CollectionType {
    collectionName: "posts";
    info: {
        singularName: "post";
        pluralName: "posts";
        displayName: "Post";
        description: "";
    };
    options: {
        draftAndPublish: true;
    };
    attributes: {
        title: Attribute.String &
            Attribute.Required &
            Attribute.Unique &
            Attribute.SetMinMaxLength<{
                maxLength: 100;
            }>;
        content: Attribute.RichText & Attribute.Required;
        slug: Attribute.UID<"api::post.post", "title"> & Attribute.Required;
        afdeling: Attribute.Relation<
            "api::post.post",
            "manyToOne",
            "api::afdeling.afdeling"
        >;
        author: Attribute.String &
            Attribute.Required &
            Attribute.SetMinMaxLength<{
                maxLength: 100;
            }> &
            Attribute.DefaultTo<"ROOD">;
        banner: Attribute.Media<"images">;
        type: Attribute.Enumeration<["nieuws", "inzending", "petitie"]> &
            Attribute.Required;
        frontpage: Attribute.Boolean & Attribute.Required;
        petition: Attribute.Relation<
            "api::post.post",
            "oneToOne",
            "api::petition.petition"
        >;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        publishedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"api::post.post", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"api::post.post", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface ApiPrivacybeleidPrivacybeleid extends Schema.SingleType {
    collectionName: "privacybeleids";
    info: {
        singularName: "privacybeleid";
        pluralName: "privacybeleids";
        displayName: "Privacybeleid";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        content: Attribute.RichText & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::privacybeleid.privacybeleid",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::privacybeleid.privacybeleid",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiProgramProgram extends Schema.SingleType {
    collectionName: "programs";
    info: {
        singularName: "program";
        pluralName: "programs";
        displayName: "Programma";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        content: Attribute.RichText & Attribute.Required;
        banner: Attribute.Media<"images"> & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<"api::program.program", "oneToOne", "admin::user"> &
            Attribute.Private;
        updatedBy: Attribute.Relation<"api::program.program", "oneToOne", "admin::user"> &
            Attribute.Private;
    };
}

export interface ApiWorkgroupWorkgroup extends Schema.CollectionType {
    collectionName: "workgroups";
    info: {
        singularName: "workgroup";
        pluralName: "workgroups";
        displayName: "Werkgroep";
        description: "";
    };
    options: {
        draftAndPublish: true;
    };
    attributes: {
        name: Attribute.String & Attribute.Required;
        about: Attribute.RichText & Attribute.Required;
        slug: Attribute.UID<"api::workgroup.workgroup", "name">;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        publishedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::workgroup.workgroup",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::workgroup.workgroup",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

export interface ApiWorkgroupsPageWorkgroupsPage extends Schema.SingleType {
    collectionName: "workgroups_pages";
    info: {
        singularName: "workgroups-page";
        pluralName: "workgroups-pages";
        displayName: "Werkgroepen-pagina";
        description: "";
    };
    options: {
        draftAndPublish: false;
    };
    attributes: {
        banner: Attribute.Media<"images"> & Attribute.Required;
        content: Attribute.RichText & Attribute.Required;
        createdAt: Attribute.DateTime;
        updatedAt: Attribute.DateTime;
        createdBy: Attribute.Relation<
            "api::workgroups-page.workgroups-page",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
        updatedBy: Attribute.Relation<
            "api::workgroups-page.workgroups-page",
            "oneToOne",
            "admin::user"
        > &
            Attribute.Private;
    };
}

declare module "@strapi/types" {
    export module Shared {
        export interface ContentTypes {
            "admin::permission": AdminPermission;
            "admin::user": AdminUser;
            "admin::role": AdminRole;
            "admin::api-token": AdminApiToken;
            "admin::api-token-permission": AdminApiTokenPermission;
            "admin::transfer-token": AdminTransferToken;
            "admin::transfer-token-permission": AdminTransferTokenPermission;
            "plugin::upload.file": PluginUploadFile;
            "plugin::upload.folder": PluginUploadFolder;
            "plugin::content-releases.release": PluginContentReleasesRelease;
            "plugin::content-releases.release-action": PluginContentReleasesReleaseAction;
            "plugin::i18n.locale": PluginI18NLocale;
            "plugin::users-permissions.permission": PluginUsersPermissionsPermission;
            "plugin::users-permissions.role": PluginUsersPermissionsRole;
            "plugin::users-permissions.user": PluginUsersPermissionsUser;
            "api::about-us.about-us": ApiAboutUsAboutUs;
            "api::afdeling.afdeling": ApiAfdelingAfdeling;
            "api::boardmember.boardmember": ApiBoardmemberBoardmember;
            "api::confidant.confidant": ApiConfidantConfidant;
            "api::confidants-page.confidants-page": ApiConfidantsPageConfidantsPage;
            "api::fallback.fallback": ApiFallbackFallback;
            "api::home.home": ApiHomeHome;
            "api::join-us.join-us": ApiJoinUsJoinUs;
            "api::petition.petition": ApiPetitionPetition;
            "api::petition-signature.petition-signature": ApiPetitionSignaturePetitionSignature;
            "api::post.post": ApiPostPost;
            "api::privacybeleid.privacybeleid": ApiPrivacybeleidPrivacybeleid;
            "api::program.program": ApiProgramProgram;
            "api::workgroup.workgroup": ApiWorkgroupWorkgroup;
            "api::workgroups-page.workgroups-page": ApiWorkgroupsPageWorkgroupsPage;
        }
    }
}
