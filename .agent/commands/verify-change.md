---
description: /verify-change verifies one active OpenSpec change against its tasks, documented evidence, and repository checks without mutating it.
agent: build
---

Verify an active OpenSpec change. This command is invoked exactly as `/verify-change <change-name>`.

User arguments:

```text
$ARGUMENTS
```

Workflow:

1. Load the `openspec-lifecycle` skill.
2. Require exactly one active OpenSpec change name. Do not infer a change from partial task completion.
3. Read its `proposal.md`, `design.md`, `tasks.md`, spec deltas, and relevant accepted specs.
4. Inspect every checked and unchecked task. Confirm checked tasks have code, tests, and documented evidence
   consistent with the task; do not check off or edit any task during verification.
5. Run `openspec validate <change-name> --strict`, `./scripts/check-plan-freshness.sh`, and
   `CHECK_DIFF_RANGE=HEAD ./scripts/check-docs.sh`.
6. Run the change's documented focused tests and fixture command. Follow `AGENTS.md`'s Terminal/caffeinate
   protocol for any command expected to run longer than two minutes.
7. Report each task as verified, incomplete, failed, or missing evidence, naming exact commands and artifact
   paths/checksums where applicable.

Do not archive the change, update task checkboxes, edit files, commit, push, create a pull request, invoke a
provider, or run a replay unless the user explicitly requests that separate action.
