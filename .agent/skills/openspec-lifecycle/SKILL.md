---
name: openspec-lifecycle
description: Use when verifying or archiving an OpenSpec change, including /verify-change and /archive-change. Enforces task evidence, OpenSpec validation, and roadmap reconciliation without replacing OpenSpec CLI commands.
---

# OpenSpec Lifecycle

## Source Of Truth

The OpenSpec CLI performs structural validation and archival. An active change's `proposal.md`, `design.md`,
`tasks.md`, spec deltas, and relevant accepted specs define its scope and completion. `tasks.md` is the task
source of truth; the autonomous roadmap tracks only phase-level status.

## Verification

1. Require one explicit active change name.
2. Read the entire change and relevant accepted specs before treating a task as complete.
3. Verify every checked task against its code, targeted tests, exact fixture command, and immutable evidence
   path/checksum when the task requires one.
4. Run strict OpenSpec validation, plan freshness, documentation freshness, and the repository checks the
   task requires. Follow `AGENTS.md` for long-running studies and evidence generation.
5. Report incomplete or unverified tasks plainly. Verification never changes task checkboxes.

## Archival

1. Refuse archival when any task is unchecked or lacks required verification evidence.
2. Run `openspec archive <change-name>` only after successful validation.
3. Revalidate all OpenSpec artifacts and archive completeness after the archive operation.
4. Update a roadmap milestone only if every governing change is archived and the milestone's documented
   immutable evidence is recorded. Do not use plan checkboxes for runtime state.

## Boundaries

- Do not replace `openspec validate` or `openspec archive` with ad hoc file moves.
- Do not infer a target change from incomplete tasks or an agent's current work.
- Do not archive, commit, push, or create a pull request without the corresponding explicit user request.
