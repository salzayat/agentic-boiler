# Tasks: Add Executable PR And Dependency Governance

## 1. PR body transport

- [ ] 1.1 Add `--body-file PATH` to `scripts/pr.sh` and preserve literal file contents through PR creation.
- [ ] 1.2 Reject simultaneous `--body` and `--body-file` values with an actionable error.
- [ ] 1.3 Add tests covering Markdown backticks, OpenSpec names, missing files, and empty bodies.

## 2. Dependency enforcement

- [ ] 2.1 Validate active OpenSpec dependency sections and exact dependency names.
- [ ] 2.2 Validate roadmap predecessor order and require `Blocked` for unready predecessors.
- [ ] 2.3 Add fixture tests for valid, missing, unknown, unready, and misordered dependencies.

## 3. Verification

- [ ] 3.1 Run strict OpenSpec validation and the focused governance tests.
- [ ] 3.2 Run documentation freshness and roadmap freshness checks.
- [ ] 3.3 Run `npm run check` and record the complete result before archiving.
