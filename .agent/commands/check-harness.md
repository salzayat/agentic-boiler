---
description: /check-harness audits project command, skill, symlink, and CI governance wiring without editing files.
agent: build
---

Audit the repository's agent-governance harness. This command is invoked exactly as `/check-harness`.

Workflow:

1. Load the `repository-harness-audit` skill.
2. Inspect `.agent/commands/`, `.agent/skills/`, `.opencode/`, `.claude/`, `CONTRIBUTING.md`,
   `docs/governance.md`, `AGENTS.md`, `.github/workflows/check.yml`, and delegated check scripts.
3. Verify command front matter, exact slash-command invocation, and every referenced skill.
4. Verify skill front matter, matching directory/name, and useful trigger descriptions.
5. Verify shared harness symlinks resolve to the canonical `.agent/` content and documentation names that
   location accurately.
6. Verify CI path filters include agent harnesses, governance docs, plans, hooks, and every script invoked
   by `scripts/check.sh`; report omissions as findings.
7. Report findings by severity with exact paths and lines. Do not edit files.

Do not change configuration, install MCP servers, invoke providers, run research execution, commit, push, or
create a pull request as part of this audit.
