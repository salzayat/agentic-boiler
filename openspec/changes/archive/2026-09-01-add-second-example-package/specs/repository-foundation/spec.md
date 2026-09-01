# Repository Foundation Delta

## ADDED Requirements

### Requirement: A second package demonstrates inter-package dependency

The repository MUST provide a second library that depends on the `hello` library's typed export, so
project-boundary and dependency-sequencing conventions are demonstrated in working code rather than
described only in prose.

#### Scenario: Composing a dependent package

- **WHEN** `packages/greeter`'s `announce` function receives a non-empty name and occasion
- **THEN** it returns a message built from `hello`'s `greet` output plus the occasion

#### Scenario: Dependent package adds its own validation

- **WHEN** `announce` receives only whitespace for `occasion`
- **THEN** it throws an error rather than returning an ambiguous result

#### Scenario: Verifying the workspace covers both packages

- **WHEN** a contributor runs the documented verification commands after `npm ci`
- **THEN** both `hello` and `greeter` build, typecheck, lint, and test successfully without network access
  or credentials
