# Design: Add Second Example Package

## Source resolution uses the existing custom condition, not tsconfig `paths`

`tsconfig.base.json` already sets `"customConditions": ["@agentic-boiler/source"]` with `moduleResolution:
"nodenext"`. That option only has an effect when a package's `package.json#exports` map defines a matching
condition. Adding a `paths` entry to `tsconfig.base.json` instead would have worked for `tsc` but not for the
runtime `node --experimental-strip-types --test` invocation `packages/hello/project.json` already uses — Node
does not read tsconfig `paths`. Using `package.json#exports` with the `@agentic-boiler/source` condition (and
`node --conditions=@agentic-boiler/source` at test time) makes the same resolution work for both `tsc` and
`node` with one mechanism, and finishes wiring an option that was already declared but unused.

## Dependency is declared twice, deliberately

`packages/greeter/package.json` declares `"@agentic-boiler/hello": "*"` so `npm install` symlinks
`node_modules/@agentic-boiler/hello -> packages/hello` (verified: `ls -la node_modules/@agentic-boiler/`
shows both symlinks after `npm install`). `packages/greeter/project.json` separately declares
`"implicitDependencies": ["hello"]` so Nx's project graph orders `hello`'s build ahead of `greeter`'s and
invalidates `greeter`'s cache when `hello` changes. npm workspaces resolves the import; Nx orders the task
graph. Neither alone is sufficient — npm doesn't know about Nx's task graph, and Nx doesn't read
`package.json#dependencies` for a project that has no `package.json`-based `implicitDependencies` inference
configured in `nx.json`.

## `greeter` composes `hello` instead of duplicating its contract

`announce()` calls `greet()` and wraps its `message`, rather than re-implementing a greeting. This is the
one property a "second package" example needs to actually teach: a dependent library consumes another
library's typed export and inherits its failure mode (an empty `name` still throws from inside `greet`),
while adding its own orthogonal validation (`occasion` must be non-empty). A design that duplicated the
greeting logic would demonstrate a second package but not a dependency.
