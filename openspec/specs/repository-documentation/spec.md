# repository-documentation Specification

## Purpose

TBD - created by archiving change improve-repository-documentation. Update Purpose after archive.

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
