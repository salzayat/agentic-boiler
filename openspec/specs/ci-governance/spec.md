# ci-governance Specification

## Purpose

TBD - created by archiving change fix-dependabot-docs-gate. Update Purpose after archive.

## Requirements

### Requirement: Dependabot-only version updates do not fail documentation freshness

The CI quality workflow MUST identify Dependabot-triggered runs explicitly. The documentation freshness check
MAY suppress only its documentation-presence failure for such a run when no documentation file is included.
All other quality gates MUST continue to run, and local or human-authored changes MUST retain the existing
documentation requirement.

#### Scenario: Dependabot version update proceeds to quality gates

- GIVEN a Dependabot pull request changes dependency versions without documentation
- WHEN the CI quality workflow runs
- THEN documentation freshness does not fail solely because no docs file changed
- AND secret, OpenSpec, harness, formatting, lint, typecheck, test, and build checks still run

#### Scenario: Human dependency change still requires documentation

- GIVEN a human-authored change modifies dependency or workflow files without documentation
- WHEN the local or CI documentation freshness check runs without the Dependabot indicator
- THEN it fails with the existing actionable documentation message
