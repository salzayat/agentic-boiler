# Tasks

## Metadata And Ownership

- [x] Complete root package metadata and prevent accidental npm publication.
- [x] Add CODEOWNERS, maintainer ownership, and support routing documentation.
- [x] Add Dependabot configuration for npm and GitHub Actions.

## Dependencies

- [x] Upgrade all Nx packages to the patched aligned release.
- [x] Confirm the high-severity npm audit finding is resolved without `--force`.

## Verification

- [x] Validate this change strictly.
- [x] Run `npm ci`.
- [x] Run `npm audit --omit=optional --audit-level=high`.
- [x] Run `npm run check` and review the complete diff.
