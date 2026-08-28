# Dependency Patterns

This repository uses two linked planning layers:

- `plans/roadmap.md` orders capabilities for execution.
- `openspec/changes/<name>/` defines the contract and implementation evidence for one capability.

Neither layer replaces accepted requirements under `openspec/specs/`.

## Roadmap Dependencies

Add one row per capability and link its governing change with backticks. Place prerequisites before dependents.
For changes in the same milestone, the leftmost governing change is selected first. Use one of these statuses:

| Status        | Meaning                                                             |
| ------------- | ------------------------------------------------------------------- |
| `Pending`     | The change exists or is planned but work has not started.           |
| `In progress` | The governing change is active and being implemented.               |
| `Blocked`     | A named predecessor is not archived or lacks verification evidence. |
| `Complete`    | The governing change is archived and its verification is recorded.  |

Keep requirements and task checklists in the change. The roadmap records only sequence, links, status, and a
short rationale when a dependency is non-obvious. Run `./scripts/check-plan-freshness.sh` after roadmap edits.
Run `./scripts/check-dependencies.sh` to validate dependency declarations, readiness, ordering, and blocked
statuses.

## OpenSpec Dependencies

Every proposal or design must include a `## Dependencies` section. Use `None` when the change is standalone.
Otherwise list each predecessor by its exact change name and state the readiness condition:

```markdown
## Dependencies

- `add-repository-evolution-markers`: archived with verification recorded in its `tasks.md`.
```

Dependency names refer to OpenSpec change directories, not branch names or pull-request numbers. A dependent
change is not ready merely because its predecessor is proposed, merged locally, or marked complete in prose.
The predecessor must be archived and its verification evidence must be reviewable.

## Template Replacement Markers

Tracked teaching examples that should be replaced or substantially adapted after cloning or forking use the
literal `TEMPLATE:REPLACE` marker in a comment. The marker belongs at the replacement boundary, not in
runtime output or a generated file. Search for the marker when starting a domain project, replace the example
and its tests together, and preserve the repository's accepted specs and checks.
