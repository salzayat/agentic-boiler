# Add Executable PR And Dependency Governance

## Why

The PR helper accepts body text only through a shell argument (`scripts/pr.sh:79-83`) and passes it through
the caller's shell before `gh pr create` (`scripts/pr.sh:217-241`). Markdown backticks and other literal
content can therefore be interpreted before the body reaches GitHub, which can corrupt verification and
OpenSpec references.

The repository planning contract requires dependency declarations and readiness (`openspec/specs/repository-
planning/spec.md:9-35`), but `scripts/check-plan-freshness.sh:24-44` currently checks only that roadmap change
names exist and that complete rows point to archived changes. It does not validate dependency sections,
dependency names, ordering, or blocked status. These are the next highest-value governance gaps because the
engineering loop still relies on reviewers to detect them.

## What Changes

- Add a safe body-file path to `scripts/pr.sh` that preserves literal Markdown and remains mutually exclusive
  with inline body input.
- Add focused tests for PR body preservation and invalid body-file usage.
- Extend repository checks to validate OpenSpec dependency declarations and roadmap readiness/order.
- Add fixture-based tests for valid, missing, unready, and incorrectly ordered dependencies.

## Non-Goals

- No change to GitHub authentication, branch restoration, commit creation, pushing, or PR authorization.
- No automatic dependency resolution, graph database, remote service, or network call beyond existing PR
  automation.
- No implementation of the unrelated `fix-roadmap-command-context` change.
- No change to application behavior, Nx targets, or the `hello` example.

## Dependencies

- `add-repository-evolution-markers`: archived with verification recorded; provides the roadmap and OpenSpec
  dependency conventions this change makes executable.
