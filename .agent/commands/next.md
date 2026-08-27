---
description: /next selects and implements the next dependency-ready OpenSpec change.
agent: build
---

Select and implement the next implementation change. This command is invoked exactly as
`/next`.

User arguments:

```text
$ARGUMENTS
```

Workflow:

1. Load the `roadmap-execution` skill.
2. Run `./scripts/check-plan-freshness.sh` from the repository root.
3. Read the Milestone Tracking table in `plans/roadmap.md`.
4. Select the earliest milestone whose status is not complete, then its leftmost governing change that is
   not archived and has incomplete tasks. Treat governing-change order as a dependency order. A partial
   later change does not override an unmet predecessor.
5. Verify the selected change exists and read its `tasks.md` to confirm it has incomplete work.
6. Read the selected change's `proposal.md`, `design.md`, `tasks.md`, spec deltas, and relevant accepted specs
   under `openspec/specs/` before editing.
7. Implement incomplete tasks only within the selected contract. Resolve behavioral ambiguity in the active
   OpenSpec artifacts before coding, and check a task only when implementation and evidence support it.
8. Run the task-required tests, fixtures, documentation checks, and repository checks. Follow `AGENTS.md`'s
   Terminal/caffeinate protocol for any long-running study, and wait for user confirmation before inspecting its
   results.
9. When every task is complete, use the established archival lifecycle controls. Report the milestone, selected
   change, completed work, verification, and any remaining authorization boundary.

Do not select a later partially complete change over an unmet predecessor. Do not invoke a provider, run a replay,
commit, push, or create a pull request unless the user explicitly requests that separate action. If the roadmap has
no dependency-ready change, report the blocking predecessor or plan drift.
