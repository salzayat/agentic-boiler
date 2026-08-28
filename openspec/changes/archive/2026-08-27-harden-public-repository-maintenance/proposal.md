# Proposal: Harden Public Repository Maintenance

## Why

The repository is now public-facing, but `package.json` lacks complete package metadata and maintainer
ownership is not discoverable from GitHub contribution paths. The dependency audit also reports a high-
severity `brace-expansion` issue through the pinned Nx 23.1.1 dependency tree. Dependency updates and
ownership policy should be repeatable rather than dependent on maintainer memory.

## What Changes

- Add complete repository, issue, homepage, author, keyword, engine, and package-manager metadata.
- Add `CODEOWNERS`, `SUPPORT.md`, and maintainer ownership guidance.
- Configure Dependabot for npm dependencies and GitHub Actions.
- Upgrade the Nx package family to the patched 23.1.2 release and verify the audit result.

## Non-Goals

- This change does not publish the workspace as an npm package or add runtime dependencies.
- This change does not add automated deployment, release authority, or external service integrations.
- This change does not suppress or waive dependency audit findings.
