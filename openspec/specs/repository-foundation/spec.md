# Repository Foundation

## Purpose

The repository provides a small, deterministic starting point for spec-driven Nx projects.

## Requirements

### Requirement: A new contributor can verify the workspace

The repository MUST document and expose commands for formatting, type checking, linting, testing,
and building the example project.

#### Scenario: Run the standard quality gates

- **WHEN** a contributor runs the documented verification commands after `npm ci`
- **THEN** each command completes successfully without network access or credentials

### Requirement: Example logic has a direct contract

The example MUST expose a typed function with explicit behavior for valid and invalid input.

#### Scenario: Greeting a named person

- **WHEN** `greet` receives a non-empty name
- **THEN** it returns a greeting containing the trimmed name

#### Scenario: Rejecting empty input

- **WHEN** `greet` receives only whitespace
- **THEN** it throws an error rather than returning an ambiguous result
