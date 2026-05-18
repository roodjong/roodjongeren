"use strict";

const { test } = require("node:test");
const assert = require("node:assert/strict");

const {
    toV4Response,
    toV4Entity,
    hasIdentifier,
    isWrappableEntity,
} = require("../src/middlewares/strapi-v4-response-shape.js");

// ---------------------------------------------------------------------------
// hasIdentifier — accepts any object with a numeric or string id. Used to
// decide whether to descend into `toV4Entity`, not to decide wrapping.
// ---------------------------------------------------------------------------

test("hasIdentifier: true for object with numeric id", () => {
    assert.equal(hasIdentifier({ id: 1 }), true);
});

test("hasIdentifier: true for object with string id", () => {
    assert.equal(hasIdentifier({ id: "abc" }), true);
});

test("hasIdentifier: false for null", () => {
    assert.equal(hasIdentifier(null), false);
});

test("hasIdentifier: false for array", () => {
    assert.equal(hasIdentifier([{ id: 1 }]), false);
});

test("hasIdentifier: false for plain object without id", () => {
    assert.equal(hasIdentifier({ name: "x" }), false);
});

// ---------------------------------------------------------------------------
// isWrappableEntity — only true when `documentId` is present. This is the
// signal that distinguishes content-type rows (which must be wrapped in the
// v4 `{ data: { id, attributes } }` envelope) from components and JSON-stored
// objects (which must stay inline).
// ---------------------------------------------------------------------------

test("isWrappableEntity: true when documentId is present", () => {
    assert.equal(isWrappableEntity({ id: 1, documentId: "abc" }), true);
});

test("isWrappableEntity: false for a component (id but no documentId)", () => {
    assert.equal(isWrappableEntity({ id: 1, question: "q?" }), false);
});

test("isWrappableEntity: false for a JSON column object with an id field", () => {
    assert.equal(isWrappableEntity({ id: "json-x", value: 42 }), false);
});

// ---------------------------------------------------------------------------
// toV4Entity
// ---------------------------------------------------------------------------

test("toV4Entity: exposes documentId as the v4 id and strips it from attributes", () => {
    const result = toV4Entity({
        id: 1,
        documentId: "abc",
        title: "Hello",
        publishedAt: "2026-01-01",
    });
    assert.deepEqual(result, {
        id: "abc",
        attributes: { title: "Hello", publishedAt: "2026-01-01" },
    });
});

test("toV4Entity: falls back to numeric id when documentId is absent", () => {
    const result = toV4Entity({ id: 7, name: "no-doc" });
    assert.deepEqual(result, { id: 7, attributes: { name: "no-doc" } });
});

// ---------------------------------------------------------------------------
// toV4Response — top-level envelope handling
// ---------------------------------------------------------------------------

test("toV4Response: single entity envelope uses documentId as id", () => {
    const v5 = {
        data: { id: 1, documentId: "abc", title: "Hello", banner: null },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.equal(v4.data.id, "abc");
    assert.equal(v4.data.attributes.title, "Hello");
    assert.equal(v4.data.attributes.banner, null);
});

test("toV4Response: list envelope with pagination", () => {
    const v5 = {
        data: [
            { id: 1, documentId: "doc-a", name: "A" },
            { id: 2, documentId: "doc-b", name: "B" },
        ],
        meta: { pagination: { page: 1, pageSize: 10, pageCount: 1, total: 2 } },
    };
    const v4 = toV4Response(v5);
    assert.equal(v4.data.length, 2);
    assert.equal(v4.data[0].id, "doc-a");
    assert.equal(v4.data[0].attributes.name, "A");
    assert.equal(v4.meta.pagination.total, 2);
});

// ---------------------------------------------------------------------------
// Nested wrapping — media, single relation, list relation
// ---------------------------------------------------------------------------

test("toV4Response: nested media field is re-wrapped", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "post-1",
            title: "T",
            banner: {
                id: 99,
                documentId: "media-x",
                url: "/u.jpg",
                formats: { large: { url: "/L.jpg" } },
            },
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.equal(v4.data.attributes.banner.data.id, "media-x");
    assert.equal(v4.data.attributes.banner.data.attributes.url, "/u.jpg");
    assert.equal(v4.data.attributes.banner.data.attributes.formats.large.url, "/L.jpg");
});

test("toV4Response: nested relation single is re-wrapped", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "post-1",
            title: "P",
            afdeling: { id: 5, documentId: "rel-y", name: "Noord", slug: "noord" },
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.equal(v4.data.attributes.afdeling.data.id, "rel-y");
    assert.equal(v4.data.attributes.afdeling.data.attributes.name, "Noord");
    assert.equal(v4.data.attributes.afdeling.data.attributes.slug, "noord");
});

test("toV4Response: nested has-many relation is re-wrapped", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "post-1",
            tags: [
                { id: 10, documentId: "tag-foo", name: "foo" },
                { id: 11, documentId: "tag-bar", name: "bar" },
            ],
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.equal(v4.data.attributes.tags.data.length, 2);
    assert.equal(v4.data.attributes.tags.data[0].id, "tag-foo");
    assert.equal(v4.data.attributes.tags.data[0].attributes.name, "foo");
});

// ---------------------------------------------------------------------------
// Inline pass-through — components, JSON columns, null relations, empty
// arrays. These are the cases an earlier version of the middleware wrapped
// incorrectly.
// ---------------------------------------------------------------------------

test("toV4Response: component repeater (objects with id, no documentId) stays inline", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "petition-1",
            extraQuestions: [
                { id: 1, question: "Age?", required: true },
                { id: 2, question: "City?", required: false },
            ],
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    // Component stays inline — must NOT be wrapped as { data: [...] }.
    assert.ok(Array.isArray(v4.data.attributes.extraQuestions));
    assert.equal(v4.data.attributes.extraQuestions.length, 2);
    assert.equal(v4.data.attributes.extraQuestions[0].question, "Age?");
});

test("toV4Response: single component (object with id, no documentId) stays inline", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "page-1",
            seo: { id: 9, metaTitle: "T", metaDescription: "D" },
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.deepEqual(v4.data.attributes.seo, {
        id: 9,
        metaTitle: "T",
        metaDescription: "D",
    });
});

test("toV4Response: JSON column with an id field stays inline (not wrapped)", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "post-1",
            metadata: { id: "json-x", label: "foo" },
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.deepEqual(v4.data.attributes.metadata, { id: "json-x", label: "foo" });
});

test("toV4Response: null single relation passes through as null", () => {
    const v5 = {
        data: { id: 1, documentId: "post-1", afdeling: null },
        meta: {},
    };
    const v4 = toV4Response(v5);
    // Frontend optional-chaining (field?.data?.attributes) coalesces both
    // null and { data: null } to null, so this is safe in practice.
    assert.equal(v4.data.attributes.afdeling, null);
});

test("toV4Response: empty has-many relation passes through as []", () => {
    // Documented limitation: without schema awareness an empty has-many
    // relation cannot be distinguished from an empty scalar array. Current
    // frontend consumers don't hit this case; locked in as the expected
    // behaviour until a caller needs `{ data: [] }`.
    const v5 = {
        data: { id: 1, documentId: "post-1", tags: [] },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.deepEqual(v4.data.attributes.tags, []);
});

// ---------------------------------------------------------------------------
// Pass-through for non-entity bodies
// ---------------------------------------------------------------------------

test("toV4Response: custom controller body without data key passes through", () => {
    const custom = { signatureCount: 5, id: 1, hook: "x" };
    const out = toV4Response(custom);
    assert.deepEqual(out, custom);
});

test("toV4Response: error response with data: null passes through", () => {
    const err = { data: null, error: { status: 404, message: "Not Found" } };
    const out = toV4Response(err);
    assert.deepEqual(out, err);
});

test("toV4Response: missing meta defaults to empty object", () => {
    const v5 = { data: { id: 1, documentId: "x", name: "x" } };
    const v4 = toV4Response(v5);
    assert.deepEqual(v4.meta, {});
});

test("toV4Response: primitive scalar in attributes is preserved", () => {
    const v5 = {
        data: {
            id: 1,
            documentId: "x",
            title: "T",
            count: 42,
            active: true,
            tags: ["a", "b"],
        },
        meta: {},
    };
    const v4 = toV4Response(v5);
    assert.equal(v4.data.attributes.count, 42);
    assert.equal(v4.data.attributes.active, true);
    assert.deepEqual(v4.data.attributes.tags, ["a", "b"]);
});

test("toV4Response: non-object body is returned as-is", () => {
    assert.equal(toV4Response(null), null);
    assert.equal(toV4Response("string"), "string");
    assert.equal(toV4Response(42), 42);
});
