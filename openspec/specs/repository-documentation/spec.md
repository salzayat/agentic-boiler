# repository-documentation Specification

## Purpose

Define the documentation and agent guidance needed to explain repository intent, authority boundaries, and safe
contribution workflows.

## Requirements

### Requirement: Documentation explains repository intent and authority

The repository documentation MUST explain that the project is a teaching-oriented Nx foundation for
agentic software, MUST describe the boundary between implementation, governance, and specifications, and
MUST identify accepted OpenSpec requirements as the behavioral authority.

#### Scenario: Orient a new engineer

- **WHEN** a new engineer reads the README and linked contributor documentation
- **THEN** they can identify the repository purpose, current example, intended Nx layout, source-of-truth
  boundaries, and standard verification command without inferring them from implementation details

### Requirement: Agent guidance is actionable and bounded

`AGENTS.md` MUST state the implementation workflow, repository safety boundaries, Nx task conventions,
and required verification commands. It MUST NOT grant agents unrestricted credentials, network access, or
authority to treat plans or prose as behavioral requirements.

#### Scenario: Agent starts a repository task

- **WHEN** an agent reads `AGENTS.md` before editing
- **THEN** it knows which specs and active change to read, where implementation belongs, how to run checks,
  and which actions require explicit user authority

### Requirement: Repository orientation documents agent-facing structure

The repository MUST provide a linked orientation document that identifies the responsibility and authority
boundary of implementation, Nx configuration, governance, OpenSpec, plans, automation, and agent harness
paths. It MUST identify the current `hello` project and distinguish tracked source from generated or ignored
output.

#### Scenario: Agent locates the right repository area

- GIVEN an agent starts a task in a clean checkout
- WHEN it reads the README and follows the repository orientation link
- THEN it can locate implementation, accepted requirements, active changes, checks, and canonical harness
  content without inferring ownership from generated files

### Requirement: Agent orientation documents bounded MCP use

The orientation MUST identify the project MCP configuration path and document that the default local Nx MCP
server is for repository inspection, Nx graph and target discovery, and bounded Nx task execution. It MUST
state that MCP configuration contains no credentials or remote servers and does not authorize deployment,
publishing, external mutation, arbitrary shell, or unrestricted network operations.

#### Scenario: Contributor configures an agent without expanding authority

- GIVEN a contributor uses the documented project agent configuration
- WHEN the contributor starts an agent in the repository
- THEN the agent can discover repository guidance and the local Nx MCP adapter
- AND the configuration does not add credentials, remote MCP endpoints, or unrestricted authority
