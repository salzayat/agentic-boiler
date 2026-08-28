---
name: agent-rule
description: Use when turning a repository request into one durable rule in AGENTS.md; with no parameter, reuse the immediately preceding user request.
---

# Agent Rule

Use this skill to add one concise, actionable rule to the canonical `AGENTS.md`.

- Prefer explicit user input when provided.
- When no parameter is provided, use the immediately preceding user request as the rule context. Do not ask
  the user to repeat it.
- Read accepted OpenSpec requirements and active changes before editing.
- If the rule changes behavior or governance, update the governing OpenSpec change before editing.
- Edit only `AGENTS.md`; `CLAUDE.md`, `.claude/`, `.opencode/`, and `.agents` are discovery adapters.
- Preserve existing safety boundaries, human attribution, licensing, and historical records.
- Run `./scripts/check-harness.sh` and relevant repository checks after the edit.
