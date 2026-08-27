---
description: /archive-change archives one fully verified OpenSpec change and reconciles its roadmap milestone.
agent: build
---

Archive one OpenSpec change. This command is invoked exactly as `/archive-change <change-name>`.

User arguments:

```text
$ARGUMENTS
```

Workflow:

1. Load the `openspec-lifecycle` skill.
2. Require exactly one active OpenSpec change name. Refuse if its `tasks.md` has any unchecked task.
3. Require a current-session `/verify-change` result, or inspect recorded task evidence and rerun every
   documented verification command and fixture before continuing.
4. Run `openspec validate <change-name> --strict`, then `openspec archive <change-name>`.
5. Run `openspec validate --all --strict`, `./scripts/check-openspec-archive.sh`, and
   `./scripts/check-plan-freshness.sh`.
6. Update the roadmap milestone only when every listed governing change is archived and its required
   immutable evidence is recorded. Otherwise retain its accurate partial or blocked status.
7. Run `CHECK_DIFF_RANGE=HEAD ./scripts/check-docs.sh` and report every file changed by archival.

Do not archive with unchecked or unverified tasks. Do not create runtime evidence, invoke providers, run
replays, commit, push, or create a pull request unless the user explicitly requests that separate action.
