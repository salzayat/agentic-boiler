# Design: Fix Dependabot Documentation Gate

## CI identity is an explicit bounded input

The workflow currently passes only `CHECK_DIFF_RANGE` to `npm run check` (`.github/workflows/check.yml:32-35`).
Add a boolean Dependabot indicator from the GitHub event actor. `check-docs.sh` may use that indicator only
when the check has implementation/workflow changes but no documentation; all other invocations retain the
existing fail-closed behavior at `scripts/check-docs.sh:32-45`.

## The exception is limited to documentation freshness

The exception applies only inside `check-docs.sh`. Secret scanning, OpenSpec validation, archive completeness,
roadmap freshness, harness validation, formatting, Nx typecheck, lint, test, and build remain mandatory through
`scripts/check.sh:4-15`. This addresses the exact Dependabot failure without granting broader CI authority.

## Dependencies

None.
