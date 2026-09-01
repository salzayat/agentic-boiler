# Add Second Example Package

## Why

The repository currently has exactly one implementation project, `packages/hello`
(packages/hello/src/index.ts, packages/hello/project.json). A single package cannot demonstrate Nx project
boundaries, inter-package dependencies, or how a second OpenSpec-governed capability is sequenced against an
existing one — all things a template repository for "spec and harness engineering" needs to show concretely,
not just describe in prose. `tsconfig.base.json` already defines a `customConditions": ["@agentic-boiler/source"]`
compiler option with no consumer, which only makes sense once a second package needs to resolve another
package's source directly (without a build step) during typecheck and test.

## What Changes

- Add `packages/hello/package.json` naming the package `@agentic-boiler/hello` and exporting `.` through the
  `@agentic-boiler/source` condition (source), `types`, and `default` (dist) — turning the existing
  `customConditions` compiler option into something real.
- Add a new library `packages/greeter` (`@agentic-boiler/greeter`) that imports `greet` from
  `@agentic-boiler/hello` and exposes a typed `announce(name, occasion)` function with an explicit
  valid/invalid contract, mirroring `packages/hello`'s target shape (build/typecheck/lint/test).
- Declare the dependency through npm workspaces (`dependencies: { "@agentic-boiler/hello": "*" }` in
  `packages/greeter/package.json`) and Nx (`implicitDependencies: ["hello"]` in
  `packages/greeter/project.json`), and resolve it at test time via `node --conditions=@agentic-boiler/source`.
- Extend the `repository-foundation` capability's requirements to cover a second, dependent package.
- Reference `packages/greeter` from `docs/repository-orientation.md` and `README.md` as the worked example of
  composing libraries.

## Dependencies

None.

## Non-Goals

- Does not introduce a build/bundling step for either package beyond the existing `@nx/js:tsc` target — no
  bundler config is added.
- Does not publish either package to a registry; both `package.json` files stay `"private": true`.
- Does not add a third package or an `apps/` project; this change adds exactly one new library.
- Does not change `packages/hello`'s public behavior — its `greet` function and requirements are unchanged.
