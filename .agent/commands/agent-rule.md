---
description: /agent-rule adds one durable repository rule to shared AGENTS.md guidance.
agent: build
---

Add one concise, durable repository rule to `AGENTS.md`. This command is invoked exactly as `/agent-rule`.

When no parameter is provided, use the immediately preceding user request as the rule context. Do not ask the
user to restate that request. Explicit parameters override prior conversational context.

User arguments:

```text
$ARGUMENTS
```

Workflow:

1. Load the `neutral-repository-attribution` skill when the rule concerns repository reviews, reports,
   documentation, or attribution; otherwise follow the repository's applicable skills.
2. Read `AGENTS.md`, relevant accepted specs under `openspec/specs/`, and any active OpenSpec change.
3. Use explicit arguments when present; otherwise use the immediately preceding user request. Convert the
   context into one actionable rule without inventing requirements or weakening existing safety boundaries.
4. Ask one concise question only when no concrete rule can be safely inferred.
5. Update only the canonical `AGENTS.md`. Do not edit `CLAUDE.md`, `.claude/`, `.opencode/`, or `.agents` as
   copies; those paths are discovery adapters.
6. If the rule changes behavior or governance, update or create the governing OpenSpec change before editing.
7. Run `./scripts/check-harness.sh` and the relevant repository checks after editing.
