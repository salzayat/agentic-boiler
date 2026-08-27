# Repository Governance

This repository demonstrates a lightweight control plane for agent-assisted development.

## Boundaries

- Requirements are versioned in `openspec/specs/`.
- Proposed work is isolated in `openspec/changes/` until reviewed.
- Source code lives in Nx projects under `packages/` or `apps/`.
- Generated output and local caches are ignored.
- Examples must not make network requests or require secrets.

## Quality gates

Formatting, type checking, linting, tests, and builds are separate targets so failures identify the
broken boundary. CI runs the same commands developers run locally.
