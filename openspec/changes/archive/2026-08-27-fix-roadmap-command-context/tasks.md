# Tasks: Fix Roadmap Command Context

## 1. Command behavior

- [x] 1.1 Update the canonical `/roadmap` command to use the immediately preceding user request when no
      parameter is provided.
- [x] 1.2 Preserve explicit argument precedence and the existing ambiguity, dependency, and authorization
      safeguards.

## 2. Verification

- [x] 2.1 Strictly validate this OpenSpec change and verify the canonical harness topology.
      Evidence: strict OpenSpec validation and `./scripts/check-harness.sh` passed.
- [x] 2.2 Confirm the command documents both empty-argument context reuse and explicit argument override.
      Evidence: `.agent/commands/roadmap.md` contains both behaviors.
- [x] 2.3 Run the focused repository convention and documentation checks; do not archive, commit, or create a
      pull request as part of this change.
      Evidence: convention, documentation freshness, and formatting checks passed; archival intentionally
      remains pending per command instruction.
