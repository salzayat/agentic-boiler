# Tasks: Add Repository Evolution Markers

## 1. Dependency and roadmap conventions

- [x] 1.1 Add the prioritized repository-evolution milestone and document left-to-right predecessor ordering,
      statuses, and readiness evidence in `plans/roadmap.md`.
- [x] 1.2 Document the OpenSpec `## Dependencies` section, dependency naming, and readiness pattern in
      `docs/dependency-patterns.md` and `plans/spec-driven-workflow.md`.

## 2. Clone and fork replacement guidance

- [x] 2.1 Document the `TEMPLATE:REPLACE` marker convention and its intended clone/fork lifecycle.
- [x] 2.2 Annotate `packages/hello/src/index.ts` and `packages/hello/src/index.test.ts` without changing
      runtime behavior.
- [x] 2.3 Link the guidance from the repository orientation and README.

## 3. Executable guard

- [x] 3.1 Add `scripts/check-repository-conventions.sh` and run it from the aggregate check.
- [x] 3.2 Ensure the check validates only stable repository conventions and reports actionable failures.

## 4. Verification

- [x] 4.1 Validate the active OpenSpec change strictly and confirm its roadmap dependency is present.
      Evidence: `npm exec openspec -- validate add-repository-evolution-markers --strict` and
      `./scripts/check-plan-freshness.sh` passed.
- [x] 4.2 Run the convention check and the focused `hello` Nx targets.
      Evidence: convention check and `hello` typecheck, lint, test, and build passed.
- [x] 4.3 Run `npm run check`, record evidence, archive the change, and rerun the aggregate check.
      Evidence: aggregate check passed before and after archival.
