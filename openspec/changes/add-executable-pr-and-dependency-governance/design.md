# Design: Add Executable PR And Dependency Governance

## Body files are the safe transport boundary

`scripts/pr.sh:79-83` currently stores inline body text in a shell variable, and `scripts/pr.sh:217-238`
constructs a default body with a quoted heredoc. Add `--body-file PATH` and read it only after argument
validation, using the file contents as an opaque string. Keep `--body` and `--body-file` mutually exclusive.
This fixes literal Markdown transport without changing the script's branch, check, commit, push, or PR flow.

## Dependency validation extends existing freshness checks

`scripts/check-plan-freshness.sh:15-37` already derives archived change names and parses roadmap rows. Extend
that check or a focused companion check to read each active change's proposal/design `## Dependencies`
section, require `None` or exact change names, and verify each named predecessor exists. Compare roadmap order
and statuses against archived/task state. Keep the implementation local and deterministic rather than adding a
dependency service.

## Tests use temporary repository fixtures

The current repository has executable shell checks but no fixture suite. Add tests that create temporary
roadmap and OpenSpec trees, then assert both success and refusal paths: literal PR body content, missing body
files, missing dependency declarations, unknown dependencies, unready predecessors, and a dependent listed
before its predecessor. Fixtures must not contain credentials or generated reports.

## Dependencies

- `add-repository-evolution-markers`: archived and verified before this change is selected.
