# Design: Agentic Boiler Governance

## Repository Boundaries

`.agent/commands/` and `.agent/skills/` remain the single source of truth for agent instructions. The
`.opencode/`, `.claude/`, and `.agents` paths are discovery adapters implemented as symlinks, while
`CLAUDE.md` points to `AGENTS.md`. This prevents divergent copies of governance content.

MCP configuration is treated as an adapter, not as agent behavior. Tool servers and their permissions
are declared in the supported editor/agent configuration files, and the default configuration exposes
read-only workspace inspection plus Nx commands only. No provider credential or unrestricted shell
authority is checked in.

## Quality Gates

Nx remains the task orchestrator. Each project owns `lint`, `typecheck`, `test`, and `build` targets;
the root `scripts/check.sh` composes OpenSpec validation, harness checks, documentation freshness,
secret scanning, and `npm` quality targets. CI runs that same command after installing pinned tools.

## Teaching Path

The `plans/` directory explains the workflow in learning order. The roadmap links to this change, while
the active change contains the contract, design, and executable task checklist. A future implementation
can therefore be reviewed by comparing each task with a concrete file, target, or test.
