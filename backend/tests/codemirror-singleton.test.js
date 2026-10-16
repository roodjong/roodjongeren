"use strict";

const { createRequire } = require("node:module");
const assert = require("node:assert/strict");
const { test } = require("node:test");

const appRequire = createRequire(require.resolve("@strapi/design-system/package.json"));
const appState = require("@codemirror/state");
const designSystemState = appRequire("@codemirror/state");

test("Strapi and its design system share one CodeMirror state instance", () => {
    assert.strictEqual(designSystemState, appState);

    assert.doesNotThrow(() => {
        appState.EditorState.create({
            extensions: [designSystemState.EditorState.allowMultipleSelections.of(true)],
        });
    });
});
