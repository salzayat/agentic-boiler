# Repository Governance

## Purpose

This repository is a reusable starting point and a worked lesson in engineering discipline. Governance is
kept visible and executable so a future project can copy the structure without copying hidden assumptions.

## Sources Of Truth

- `openspec/specs/`: accepted behavioral contracts and scenarios
- `openspec/changes/`: proposed deltas awaiting implementation and review
- `design.md`: architecture and important tradeoffs for one change
- `tasks.md`: ordered implementation and verification checklist for one change
- `AGENTS.md`: instructions for agents operating in this repository
- `CONTRIBUTING.md`: human contribution workflow
- `README.md`, `docs/`, and `plans/`: explanation and teaching material, never replacement requirements

When these layers disagree, update the governing contract first. Do not resolve behavioral ambiguity by
silently choosing an implementation.

## Architecture Boundaries

Nx is the task orchestrator and project graph. Libraries under `packages/` own reusable logic; future
applications under `apps/` compose libraries and should not become the home for domain decisions. Root
scripts provide repository-wide checks and automation. Agent configuration stays outside application code.

The current `hello` library demonstrates typed behavior, tests, explicit targets, and build output without
pretending to be a complete application.

## Quality And Safety

`npm run check` is the canonical gate for local development and CI. It validates specs, harness links,
archive status, roadmap references, documentation freshness, secrets, formatting, lint, types, tests, and
builds. Checks should fail explicitly when required tooling is unavailable.

Examples must remain deterministic, local-only, and credential-free. Never commit environment files,
secrets, dependency directories, caches, or generated artifacts. Agent and MCP access is bounded and does
not imply permission to deploy, publish, mutate external systems, or run arbitrary network operations.
Dependabot-only version updates may use the documented documentation-freshness exception; all other changes
must update relevant documentation.

## Change And Review Standard

Every behavior or workflow change needs a governing OpenSpec change or a documented rationale appropriate
to a documentation-only edit. Reviewers should ask whether the code, design, tasks, docs, and verification
agree. Pull requests must identify exact commands, skipped checks, and generated-output impact.

## Documentation Freshness

`./scripts/check-docs.sh` compares staged files locally or the `CHECK_DIFF_RANGE` in CI. Changes to code,
scripts, hooks, CI, dependencies, Nx configuration, project layout, or commands should update the relevant
README, docs, agent guidance, or OpenSpec in the same change.
