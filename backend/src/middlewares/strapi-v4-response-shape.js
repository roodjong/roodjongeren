"use strict";

/**
 * Strapi 4 -> 5 transition shim.
 *
 * When enabled, this middleware re-wraps Strapi 5 flat REST responses back
 * into the v4 envelope shape ({ data: { id, attributes }, meta }, with nested
 * media and relations re-wrapped as { data: { id, attributes } } / { data: [...] }).
 *
 * Scope: only /api/* responses. Custom controllers that return non-enveloped
 * payloads (no top-level `data` key) are passed through unchanged.
 *
 * Removed once the frontend natively reads the v5 shape.
 *
 * Note on relation detection: in Strapi 5 every content-type row carries a
 * string `documentId`. Components and JSON-stored objects do NOT. We use the
 * presence of `documentId` to tell wrappable relations/media/entities apart
 * from inline values that must pass through unchanged. Without this guard a
 * petition's `extraQuestions` component or a JSON column with an `id` field
 * would be incorrectly wrapped as `{ data: [...] }` and break v4 consumers.
 *
 * Known limitation: an empty has-many relation (`tags: []`) cannot be
 * distinguished from an empty scalar array without schema awareness, so
 * empty arrays pass through unchanged. Current frontend consumers don't hit
 * this case; if a future caller needs it, switch to schema lookup via
 * `strapi.contentTypes[uid]`.
 */

const MIDDLEWARE_NAME = "strapi-v4-response-shape";

function hasIdentifier(value) {
    return (
        value !== null &&
        typeof value === "object" &&
        !Array.isArray(value) &&
        (typeof value.id === "number" || typeof value.id === "string")
    );
}

function isWrappableEntity(value) {
    return (
        value !== null &&
        typeof value === "object" &&
        !Array.isArray(value) &&
        typeof value.documentId === "string"
    );
}

function toV4Field(value) {
    if (Array.isArray(value)) {
        if (value.length > 0 && value.every(isWrappableEntity)) {
            return { data: value.map(toV4Entity) };
        }
        return value.map(toV4Field);
    }
    if (isWrappableEntity(value)) {
        return { data: toV4Entity(value) };
    }
    return value;
}

function toV4Entity(entity) {
    if (!hasIdentifier(entity)) return entity;
    const { id, documentId, ...rest } = entity;
    // In v5 the public identifier is documentId (string); the numeric id is
    // internal. Expose documentId as the v4 `id` field so URLs that consumers
    // build from this value (e.g. /api/petitions/:id) hit the v5 default
    // router which expects documentId. Fall back to the numeric id for rows
    // without a documentId (e.g. legacy tables).
    const publicId = documentId !== undefined ? documentId : id;
    const attributes = {};
    for (const key of Object.keys(rest)) {
        attributes[key] = toV4Field(rest[key]);
    }
    return { id: publicId, attributes };
}

function toV4Response(body) {
    if (!body || typeof body !== "object" || Array.isArray(body)) return body;
    if (!Object.prototype.hasOwnProperty.call(body, "data")) return body;

    const { data, meta } = body;
    if (Array.isArray(data)) {
        return { ...body, data: data.map(toV4Entity), meta: meta ?? {} };
    }
    if (hasIdentifier(data)) {
        return { ...body, data: toV4Entity(data), meta: meta ?? {} };
    }
    return body;
}

module.exports = (config, { strapi }) => {
    const enabled = Boolean(config && config.enabled);
    if (enabled) {
        strapi.log.info(`[${MIDDLEWARE_NAME}] enabled`);
    }

    return async (ctx, next) => {
        await next();

        if (!enabled) return;
        if (!ctx.path || !ctx.path.startsWith("/api/")) return;

        const body = ctx.body;
        if (!body || typeof body !== "object") return;

        ctx.body = toV4Response(body);
    };
};

// Exported for tests.
module.exports.toV4Response = toV4Response;
module.exports.toV4Entity = toV4Entity;
module.exports.hasIdentifier = hasIdentifier;
module.exports.isWrappableEntity = isWrappableEntity;
