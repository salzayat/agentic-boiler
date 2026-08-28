# Design: Repository Documentation Intent

## One Teaching Narrative

The docs will use one progression: define behavior in OpenSpec, record architecture in `design.md`, break
work into verifiable tasks, implement inside Nx project boundaries, and prove the result through targets
and the aggregate check. Each document will link to the next layer without copying its content.

## Authority Boundaries

`AGENTS.md` contains instructions for agents working in this repository. `CONTRIBUTING.md` contains the
human contribution workflow. `docs/governance.md` explains the durable repository policies. `README.md`
is the entry point and should remain short enough to orient a first-time reader. Accepted specs remain the
behavioral authority; the documentation change only clarifies that relationship.

## Current And Future Layout

The current example is the `hello` library under `packages/hello`. The docs will explain that Nx project
boundaries are intentional: reusable domain/application logic belongs in libraries, while future apps
should compose those libraries. Governance, requirements, and tooling remain at the repository boundary.

## Verification

Documentation-only changes are verified with strict OpenSpec validation, formatting, the harness and
documentation checks, and the complete Nx quality gate. No generated output is introduced.
