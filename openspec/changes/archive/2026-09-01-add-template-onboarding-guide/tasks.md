# Tasks: Add Template Onboarding Guide

## 1. Mark `greeter` as replaceable example code

- [x] 1.1 Add the `TEMPLATE:REPLACE` marker comment to `packages/greeter/src/index.ts`.
- [x] 1.2 Add the `TEMPLATE:REPLACE` marker comment to `packages/greeter/src/index.test.ts`.
- [x] 1.3 Confirm `packages/greeter`'s build/typecheck/lint/test targets still pass with the comment added.

## 2. Write `TEMPLATE.md`

- [x] 2.1 Add `TEMPLATE.md` at the repository root with the ordered checklist: rename identity strings,
      replace `TEMPLATE:REPLACE` markers, run `npm run check`, propose the first domain change with
      `/roadmap`.
- [x] 2.2 List every identity string to rename by exact file and field: `package.json` (`name`,
      `repository.url`, `bugs.url`, `homepage`) and `README.md` (title, opening description).

## 3. Cross-link the guide

- [x] 3.1 Link `TEMPLATE.md` from `README.md`'s introduction.
- [x] 3.2 Link `TEMPLATE.md` from `docs/repository-orientation.md`'s "Agent Loop" section.

## 4. Verification

- [x] 4.1 `grep -r TEMPLATE:REPLACE packages/` returns both `hello` and `greeter` implementation and test
      files, proving the guide's search step finds everything it should.
- [x] 4.2 `openspec validate add-template-onboarding-guide --strict` passes.
- [x] 4.3 `npm run check` passes.
