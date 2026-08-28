# Design: Improve Agent Repository Orientation

## One orientation document, linked from existing entry points

`README.md:72-84` already provides a useful short map, and `docs/governance.md:8-19` defines authority
boundaries. The new `docs/repository-orientation.md` expands those explanations without duplicating
MUST-level requirements. README, `AGENTS.md`, and `CONTRIBUTING.md` link to it as their detailed map.

## Canonical harness with adapters, not copies

The actual harness topology is defined by `scripts/check-harness.sh:9-25`: `.agent/commands/` and
`.agent/skills/` are canonical, and `.opencode/`, `.claude/`, `.agents`, and `CLAUDE.md` are discovery
symlinks. The orientation document will describe those exact paths and the check command rather than
inventing another agent configuration source.

## Nx MCP remains a bounded local adapter

`opencode.json:2-8` currently enables only the local `nx-mcp` command. The change keeps that server and
adds only the standard OpenCode schema metadata. Documentation will describe MCP as an agent/editor
adapter for repository inspection, project graph and target discovery, and bounded Nx task execution.
Credentials, remote servers, deployment, publishing, arbitrary shell, and unrestricted network access
remain outside the repository configuration as required by `openspec/specs/agentic-boiler-governance/spec.md:21-32`.

## Loop workflow points to executable evidence

The workflow follows `plans/spec-driven-workflow.md:16-26`: read contract, draft and validate an active
change, implement the smallest slice, run focused checks and `npm run check`, then verify and archive.
The document will present this as an agent loop while keeping accepted specs as the behavioral authority.
