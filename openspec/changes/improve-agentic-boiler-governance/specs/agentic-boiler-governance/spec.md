# Agentic Boiler Governance

## ADDED Requirements

### Requirement: The agent harness has one canonical source

The repository MUST store project commands under `.agent/commands/` and project skills under
`.agent/skills/`. Agent-specific discovery paths MUST resolve to those directories through symlinks or
an equivalent explicitly verified adapter, rather than copied content.

#### Scenario: Verify shared harness topology

- **GIVEN** a clean checkout
- **WHEN** a contributor runs the harness check
- **THEN** canonical directories, command front matter, skill front matter, and all documented links pass

### Requirement: Agent tools have bounded MCP access

The repository MUST document MCP configuration paths and the capabilities exposed to agents. The default
configuration MUST be read-only for source inspection and bounded Nx task discovery/execution, MUST NOT
contain credentials, and MUST NOT grant unrestricted arbitrary network or shell authority.

#### Scenario: Configure a supported local agent

- **GIVEN** a contributor selects a supported agent integration
- **WHEN** the documented non-interactive setup command is run
- **THEN** the agent can discover the repository guidance and documented MCP configuration without copying
  commands or skills

### Requirement: Governance checks cannot silently disappear in CI

The CI workflow MUST run the same aggregate governance and Nx quality command documented for local use.
Required validation tools MUST be pinned or their absence MUST fail the check instead of silently skipping
the corresponding gate.

#### Scenario: Run the CI-equivalent check locally

- **WHEN** a contributor runs `npm run check` after `npm ci`
- **THEN** OpenSpec, harness, documentation, secret, formatting, lint, typecheck, test, and build checks
  either run successfully or report an explicit actionable failure

### Requirement: Roadmap status reflects OpenSpec state

The roadmap MUST link each planned capability to its governing OpenSpec change and MUST distinguish pending,
blocked, and complete work. A capability MUST NOT be marked complete while its governing change has unchecked
tasks or lacks documented verification.

#### Scenario: Detect roadmap drift

- **GIVEN** a roadmap row references an active change with incomplete tasks
- **WHEN** the roadmap freshness check runs
- **THEN** it reports the row as pending or drifted rather than accepting an unqualified complete status
