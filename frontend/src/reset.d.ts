// Type-only side-effect import. Tightens built-in lib types
// (`Array.filter(Boolean)` narrows, `JSON.parse` returns `unknown`, etc.).
// See https://www.totaltypescript.com/ts-reset for the full list.
import "@total-typescript/ts-reset";
