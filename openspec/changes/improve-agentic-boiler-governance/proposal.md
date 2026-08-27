# Proposal: Improve Agentic Boiler Governance

## Why

The initial workspace proves that Nx targets and a small OpenSpec can work together, but it is not yet
a complete public starter. `package.json` currently maps `lint` to a TypeScript command, and the CI
workflow delegates to `npm run check` without installing optional OpenSpec or gitleaks binaries. The
shared `.agent/` harness is present, but MCP configuration and its relationship to the repository tree
are only implicit.

## What Changes

- Add a documented agent and MCP repository layout.
- Make supported agent configuration reproducible and non-interactive.
- Add real linting and dependency/security policy to the quality gate.
- Add public-repository metadata and a worked OpenSpec lifecycle example.
- Keep all agent commands and skills canonical under `.agent/`, with harness-specific symlinks.

## Non-Goals

- This change does not add an AI provider, autonomous code execution, credentials, or network access.
- This change does not choose a single editor or agent vendor.
- This change does not turn the example package into a production application.
