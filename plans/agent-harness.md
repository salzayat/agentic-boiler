# Agent Harness Map

The repository keeps agent instructions portable by separating canonical content from discovery paths.

```text
AGENTS.md                         repository rules
CLAUDE.md -> AGENTS.md            Claude-compatible rules
.agent/
  commands/                       canonical slash commands
  skills/                         canonical reusable skills
.agents -> .agent                 plural-agent discovery adapter
.opencode/
  command -> ../.agent/commands   OpenCode command adapter
  skills -> ../.agent/skills       OpenCode skill adapter
.claude/
  commands -> ../.agent/commands   Claude command adapter
  skills -> ../.agent/skills       Claude skill adapter
.github/workflows/                CI quality gates
scripts/                          local governance and automation
openspec/                         behavioral contracts and proposed changes
plans/                            teaching roadmap and workflow guides
```

## MCP Boundary

MCP configuration belongs in the agent/editor adapter layer, not in application packages. When Nx
configures agents, inspect the generated files and keep only repository-local, read-only capabilities:

- workspace file inspection
- Nx project graph and target discovery
- bounded Nx task execution

Do not commit API keys, personal filesystem paths, unrestricted shell servers, or arbitrary network
servers. The active governance change `improve-agentic-boiler-governance` tracks the concrete setup and
verification work.
