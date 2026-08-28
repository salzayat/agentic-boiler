# Tasks: Add Executable PR And Dependency Governance

## 1. PR body transport

- [x] 1.1 Add `--body-file PATH` to `scripts/pr.sh` and preserve literal file contents through PR creation.
- [x] 1.2 Reject simultaneous `--body` and `--body-file` values with an actionable error.
- [x] 1.3 Add tests covering Markdown backticks, OpenSpec names, missing files, and conflicting body inputs.
      Evidence: `scripts/test-governance.sh` and PR argument validation tests pass.

## 2. Dependency enforcement

- [x] 2.1 Validate active OpenSpec dependency sections and exact dependency names.
- [x] 2.2 Validate roadmap predecessor order and require `Blocked` for unready predecessors.
- [x] 2.3 Add fixture tests for valid, missing, unknown, unready, and misordered dependencies.
      Evidence: `scripts/test-governance.sh` passes all dependency fixtures.

## 3. Verification

- [x] 3.1 Run strict OpenSpec validation and the focused governance tests.
      Evidence: strict validation and `scripts/test-governance.sh` pass.
- [x] 3.2 Run documentation freshness and roadmap freshness checks.
      Evidence: both checks pass with `CHECK_DIFF_RANGE=HEAD`.
- [x] 3.3 Run `npm run check` and record the complete result before archiving.
      Evidence: full local gate passes before archival.
