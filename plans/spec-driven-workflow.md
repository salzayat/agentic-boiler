# Spec-Driven Workflow

This file is a teaching guide, not a second requirements source. The accepted contract lives under
`openspec/specs/`; proposed work lives under `openspec/changes/`.

## The Four Artifacts

1. `proposal.md` explains why the change exists, what it changes, and what it explicitly does not do.
2. `design.md` records architecture and decisions grounded in the current repository.
3. `tasks.md` turns the design into ordered, verifiable work.
4. `specs/<capability>/spec.md` states MUST-level behavior with Given/When/Then scenarios.

## Lifecycle

1. Read accepted specs and the current code before drafting.
2. Create an active change and validate it strictly.
3. Implement only the accepted contract and record evidence in tasks.
4. Run focused tests and `npm run check`.
5. Verify the change without changing task status.
6. Archive only after every task and verification requirement is complete.

Try the agent commands through the shared harness: `/spec-audit`, `/verify-change`, and
`/archive-change`.
