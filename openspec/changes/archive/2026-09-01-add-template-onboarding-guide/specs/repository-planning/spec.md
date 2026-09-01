# repository-planning Delta

## ADDED Requirements

### Requirement: A fork owner has a single ordered onboarding path

The repository MUST provide a root-level guide that gives a fork owner an ordered, checkable sequence for
turning the template into their own project: rename identity strings, replace `TEMPLATE:REPLACE`-marked
example code, run the verification gate, then propose their first domain OpenSpec change.

#### Scenario: Fork owner follows the guide to a verified, renamed project

- **WHEN** a contributor forks the repository and follows `TEMPLATE.md` in order
- **THEN** `package.json` and `README.md` no longer reference `agentic-boiler` or `salzayat/agentic-boiler`
- **AND** no tracked file under `packages/` contains a `TEMPLATE:REPLACE` marker
- **AND** `npm run check` passes

#### Scenario: Marker search covers every teaching example, not just the first one

- **WHEN** a contributor searches tracked implementation and test files for `TEMPLATE:REPLACE`
- **THEN** both `packages/hello` and `packages/greeter` implementation and test files are found
