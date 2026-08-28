# Proposal: Clarify Repository Design Intent

## Why

The repository has the pieces of a reusable Nx and spec-engineering foundation, but its documentation
describes those pieces in isolation. A new engineer should not have to infer why `packages/`, `openspec/`,
`scripts/`, the agent harness, and `plans/` exist or which source is authoritative when guidance overlaps.

## What Changes

- State the repository mission, design principles, and intended growth path in the README.
- Consolidate agent responsibilities, boundaries, and verification expectations in `AGENTS.md`.
- Turn contributor guidance into a practical workflow from issue to archived OpenSpec change.
- Clarify the roles of accepted specs, active changes, design documents, tasks, plans, and implementation.
- Update harness and roadmap teaching docs so examples describe the merged repository state.

## Non-Goals

- This change does not add an application, framework, provider integration, or network-dependent example.
- This change does not change Nx project behavior, quality-gate behavior, or agent permissions.
- This change does not make plans or README prose an alternative source of behavioral requirements.
