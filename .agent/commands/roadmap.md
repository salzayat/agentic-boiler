---
description: /roadmap adds a concrete capability to the roadmap with an OpenSpec change and explicit dependencies.
agent: build
---

Add a proposed capability to `plans/roadmap.md`. This command is invoked exactly as `/roadmap`.

When no parameter is provided, use the immediately preceding user request as the capability description.
Do not ask the user to restate that request. Explicit parameters override prior conversational context.

User arguments:

```text
$ARGUMENTS
```

Workflow:

1. Read `plans/roadmap.md`, `docs/governance.md`, relevant accepted specs, and the
   active and archived OpenSpec changes.
2. Use the explicit user parameter when present; otherwise use the immediately preceding user request. Infer
   the proposed phase position and known dependencies from that context and repository evidence. Ask one
   concise question before editing only for details that remain genuinely ambiguous.
3. Determine whether an existing unarchived OpenSpec change exactly covers the capability. Do not attach an
   unrelated change merely because it has a similar name.
4. If no matching change exists, load the `openspec-change` skill. Ground, scaffold, and validate a new
   OpenSpec change before adding it to the roadmap.
5. Add the change to an existing milestone only when its outcome and completion evidence match that
   milestone. Otherwise add a new pending milestone in dependency order, with governing changes listed
   left to right, an accurate status, and concrete completion evidence.
6. Add concise phase prose only when needed to explain sequencing, dependencies, or the intended outcome.
   Do not copy requirements, scenarios, or task checklists from OpenSpec into the plan.
7. Run `./scripts/check-plan-freshness.sh` and `./scripts/check-docs.sh` with `CHECK_DIFF_RANGE=HEAD`.
8. Report the roadmap location, linked OpenSpec change, dependency rationale, and validation results.

Do not mark milestones complete, check off OpenSpec tasks, archive changes, invoke providers, run replays,
commit, or create a pull request unless the user explicitly requests those actions.
