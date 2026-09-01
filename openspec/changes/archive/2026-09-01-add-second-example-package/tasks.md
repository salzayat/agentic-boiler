# Tasks: Add Second Example Package

## 1. Wire source-condition resolution

- [x] 1.1 Add `packages/hello/package.json` naming `@agentic-boiler/hello` with `exports` mapping the
      `@agentic-boiler/source`, `types`, and `default` conditions.
- [x] 1.2 Run `npm install` and confirm `node_modules/@agentic-boiler/hello` symlinks to `packages/hello`.

## 2. Add the `greeter` package

- [x] 2.1 Add `packages/greeter/package.json` (`@agentic-boiler/greeter`, depends on
      `@agentic-boiler/hello`) with matching `exports`.
- [x] 2.2 Add `packages/greeter/project.json` with `build`, `typecheck`, `lint`, `test` targets matching
      `packages/hello/project.json`'s shape, plus `implicitDependencies: ["hello"]`.
- [x] 2.3 Add `packages/greeter/tsconfig.lib.json` extending `tsconfig.base.json`.
- [x] 2.4 Implement `packages/greeter/src/index.ts` exporting `announce(name, occasion)`, importing `greet`
      from `@agentic-boiler/hello`.
- [x] 2.5 Add `packages/greeter/src/index.test.ts` covering a valid call and the empty-`occasion` failure.

## 3. Update the accepted spec and docs

- [x] 3.1 Add a `repository-foundation` requirement covering a dependent second package.
- [x] 3.2 Reference `packages/greeter` in `docs/repository-orientation.md` as the composition example.
- [x] 3.3 Reference `packages/greeter` in `README.md` alongside the existing `hello` mention.

## 4. Verification

- [x] 4.1 `npx nx run-many -t build,typecheck,lint,test` succeeds for both `hello` and `greeter`.
- [x] 4.2 `node --conditions=@agentic-boiler/source --experimental-strip-types --test
packages/greeter/src/index.test.ts` passes, proving source (not dist) resolution works without a build.
- [x] 4.3 `openspec validate add-second-example-package --strict` passes.
- [x] 4.4 `npm run check` passes.
