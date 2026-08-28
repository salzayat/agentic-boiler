# Design: Public Repository Maintenance

## Package Metadata

The root package remains the workspace manifest, not a published library. Metadata will identify the GitHub
repository, issue tracker, homepage, license, author, keywords, Node/npm engines, and package manager. The
existing `private: false` value will be changed to `private: true` to prevent accidental npm publication;
future publishable libraries can declare their own package metadata.

## Ownership And Support

`.github/CODEOWNERS` is the machine-readable review default. `MAINTAINERS.md` explains the ownership model
for learners and `SUPPORT.md` routes questions, bugs, features, and security reports to the right channel.
The initial owner is the repository owner, represented by `@salzayat`.

## Dependency Maintenance

Dependabot will open bounded weekly update pull requests for npm and GitHub Actions, grouping non-major npm
updates to avoid noisy review. The Nx family will remain version-aligned. The audit fix is an explicit
patch-level Nx update, not a forced lockfile rewrite.

## Verification

Verification includes strict OpenSpec validation, `npm ci`, `npm audit --omit=optional --audit-level=high`,
the complete `npm run check` gate, and review of package metadata and ownership paths.
