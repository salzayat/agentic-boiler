# public-repository-maintenance Specification

## Purpose

Define the public repository metadata, ownership, support, security, and publication safeguards expected at the
repository boundary.

## Requirements

### Requirement: Repository metadata identifies ownership and prevents accidental publication

The root package manifest MUST identify the repository, issue tracker, license, maintainer, supported Node
and npm versions, package manager, and relevant discovery keywords. The workspace manifest MUST NOT be
accidentally publishable as an npm package.

#### Scenario: Inspect the public package manifest

- **WHEN** a contributor reads the root `package.json`
- **THEN** they can find the project URL, issue URL, license, maintainer, supported toolchain, and package
  intent without searching implementation files

### Requirement: Public ownership and support paths are discoverable

The repository MUST define default code ownership and document maintainer responsibilities and support
routing in repository-visible files. Security reports MUST be directed to a private reporting path rather
than a public issue.

#### Scenario: Route a contributor question

- **WHEN** a contributor has a bug, feature request, support question, or security concern
- **THEN** `SUPPORT.md`, `CONTRIBUTING.md`, or the issue templates identify the appropriate next step

### Requirement: Dependency maintenance is automated and auditable

The repository MUST configure automated update proposals for npm and GitHub Actions. Dependency updates
MUST remain reviewable through pull requests and MUST NOT disable the repository audit or quality checks.

#### Scenario: A dependency update is available

- **WHEN** Dependabot evaluates the configured ecosystems
- **THEN** it can open a bounded update pull request that runs the standard repository quality gate
