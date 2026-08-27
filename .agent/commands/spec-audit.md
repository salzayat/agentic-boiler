---
description: /spec-audit reviews one active OpenSpec change for contract completeness, drift, and evidence gaps without editing files.
agent: build
---

Audit one active OpenSpec change. This command is invoked exactly as `/spec-audit <change-name>`.

User arguments:

```text
$ARGUMENTS
```

Workflow:

1. Load the `openspec-contract-audit` skill.
2. Require exactly one active change name. Refuse archived or missing changes.
3. Read the change's proposal, design, tasks, all spec deltas, relevant accepted specs, and the code cited by
   its design or proposal.
4. Run `openspec validate <change-name> --strict`.
5. Identify missing scenarios, task-to-requirement evidence gaps, conflicts with accepted specs, unsupported
   implementation claims, immutable-artifact incompatibilities, and unbounded authority, data, or
   no-look-ahead paths.
6. Report findings first by severity with exact file and line references. Distinguish structural validator
   results from human contract-review findings.

Do not edit the change, check tasks, archive it, invoke providers, run replays, commit, push, or create a
pull request as part of this audit.
