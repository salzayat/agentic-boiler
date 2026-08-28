# Design: Add Repository Evolution Markers

## A convention documented beside the workflow, not hidden in tooling

`plans/spec-driven-workflow.md:7-23` already assigns distinct responsibilities to proposal, design, tasks,
and capability spec files. A new `## Dependencies` section in proposals and designs extends that workflow
without moving requirements into plans. `docs/dependency-patterns.md` teaches the convention and gives a
small example; it does not become a second source of behavioral truth.

## Roadmap order is the dependency declaration

`plans/roadmap.md:7-17` currently uses a three-column milestone table and states that governing changes are
the links to detailed work. The first milestone will retain that shape and add concise rules: changes are
listed left to right, each predecessor must be archived before its successor is selected, and status reflects
actual OpenSpec state. This keeps the existing `check-plan-freshness.sh:24-37` parser compatible while
making readiness explicit to users.

## Markers identify replacement boundaries without changing behavior

The `hello` library is intentionally a deterministic teaching example (`packages/hello/src/index.ts:5-13`)
and its tests are the only consumers (`packages/hello/src/index.test.ts:1-11`). Add the same
`TEMPLATE:REPLACE` marker convention to the implementation and test fixture, with a link to the documented
pattern. The marker is a visible annotation, not runtime logic, and tells a fork owner to replace the example
when real domain behavior is introduced.

## Verification checks the contract, not arbitrary future code

The repository already runs shell checks from `scripts/check.sh:4-14`. Add a focused
`check-repository-conventions.sh` check that verifies the roadmap references this change, the dependency and
marker documentation exists, and the current example contains the marker. It will fail closed when these
teaching conventions disappear, while avoiding assumptions about future project names.

## Dependencies

None. This change deliberately precedes later capabilities so their proposals can use the documented
dependency and readiness convention.
