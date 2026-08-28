---
name: repository-harness-audit
description: Use when auditing /check-harness, agent commands, skills, shared harness symlinks, or CI governance wiring. Performs static repository-control review without modifying files.
---

# Repository Harness Audit

`CONTRIBUTING.md` defines `.agent/commands/` and `.agent/skills/` as the canonical shared harness content.

1. Inspect command front matter, exact invocation, and referenced project skills.
2. Inspect skill front matter for a lowercase hyphenated name matching its directory and a useful trigger.
3. Resolve shared symlinks and flag copied, missing, dangling, or divergent harness content.
4. Compare governance documentation with actual canonical paths and registered commands/skills.
5. Read `scripts/check.sh` and every script it invokes. Ensure CI affected-path logic covers those scripts,
   hooks, plans, governance docs, `.agent/`, and workflow files.

Report findings by severity with exact references. This is static contract review, not LLM-behavior
simulation, and it never edits a harness.
