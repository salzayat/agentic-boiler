# Add Template Onboarding Guide

## Why

The repository is explicitly meant to be forked as a starting point (README.md:1-7,
docs/governance.md:5). It already carries the mechanics a fork owner needs — the `TEMPLATE:REPLACE` marker
convention (openspec/specs/repository-planning/spec.md:38-49, currently only on
`packages/hello/src/index.ts:1` and `packages/hello/src/index.test.ts:5`), a second example package showing
composition (`packages/greeter`), and identity strings that name this specific project
(`package.json:2,13,16,18`: `"agentic-boiler"`, `github.com/salzayat/agentic-boiler`). None of this is tied
together into a single "I just forked this, what do I do" path. `CONTRIBUTING.md` documents the ongoing
change workflow for people already working in this repository, not the one-time fork setup a new adopter
needs first.

## What Changes

- Add `TEMPLATE.md` at the repository root: fork → rename identity strings (`package.json` `name`,
  `repository.url`, `bugs.url`, `homepage`; `README.md` title and description) → search tracked files for
  `TEMPLATE:REPLACE` and replace the example implementation and its test → run `npm run check` → propose the
  first domain OpenSpec change with `/roadmap`.
- Add the `TEMPLATE:REPLACE` marker to `packages/greeter/src/index.ts` and
  `packages/greeter/src/index.test.ts`, since it is tracked example code demonstrating composition and is
  expected to be replaced or adapted the same way `hello` is, per the existing marker requirement.
- Cross-link `TEMPLATE.md` from `README.md`'s introduction and from `docs/repository-orientation.md`'s
  "Agent Loop" section (which already links `docs/dependency-patterns.md` for the `TEMPLATE:REPLACE`
  convention itself).

## Dependencies

- `add-second-example-package`: archived (`openspec/changes/archive/2026-09-01-add-second-example-package`)
  with all tasks and `npm run check` verification recorded in its `tasks.md`. `TEMPLATE.md` references
  `packages/greeter` as part of the replacement step, so the package must already exist and be governed by
  an accepted spec before this guide can point to it.

## Non-Goals

- Does not automate the rename (no script that edits `package.json` or greps/replaces identity strings) —
  the guide is documentation, not tooling.
- Does not mark the repository as a GitHub "template repository" or add any `.github/` configuration; that
  is a separate, not-yet-proposed capability.
- Does not change `packages/hello` or `packages/greeter` behavior — only adds a marker comment to the
  latter, which changes no runtime output.
- Does not replace `CONTRIBUTING.md`'s ongoing change workflow; `TEMPLATE.md` covers only the one-time fork
  setup that precedes it.
