# Fix Dependabot Documentation Gate

## Why

The documentation freshness check requires documentation whenever dependency manifests or CI workflow files
change (`scripts/check-docs.sh:25-45`). Dependabot PRs #13-#19 change only dependency versions, but their CI
fails before formatting, typechecking, tests, or builds because no explanatory documentation is staged. This
blocks routine automated maintenance while providing no user-facing behavior change to document.

## What Changes

- Allow the CI workflow to identify Dependabot-triggered checks explicitly.
- Let `check-docs.sh` bypass the docs requirement only for Dependabot runs with no staged documentation, while
  preserving the existing gate for local and human-authored changes.
- Document the narrow exception and add an OpenSpec contract for the failure boundary.

## Non-Goals

- No bypass of secret scanning, OpenSpec, harness, formatting, lint, typecheck, test, or build checks.
- No documentation exemption for human-authored dependency, script, configuration, or workflow changes.
- No automatic merge, approval, or security permission for Dependabot.
- No change to application behavior or dependency versions.

## Dependencies

None. This is a CI governance correction for the existing repository quality gate.
