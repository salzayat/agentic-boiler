# Documentation Freshness

Documentation and specs are part of implementation. A change is incomplete when behavior, commands,
configuration, project layout, or workflow changes but repository guidance is stale.

## Automated Check

`./scripts/check-docs.sh` compares staged files locally. In CI, set `CHECK_DIFF_RANGE` to compare the
pull request range. The check requires a related OpenSpec, README, `docs/`, `AGENTS.md`, or
`CONTRIBUTING.md` update when implementation or workflow files change.

The check prevents omission; reviewers still verify that the documentation is accurate, concise, and
teaches the intended design rather than merely restating filenames.

Dependabot version-only updates are the narrow exception. CI passes `CHECK_DEPENDABOT=true` for the
Dependabot actor, allowing its documentation-presence failure to be skipped while every other quality gate
still runs. Human-authored dependency or workflow changes must continue to include documentation.

## Review Checklist

- Are commands copied exactly from runnable scripts or package targets?
- Do paths and project names exist in the current workspace?
- Does the documentation identify the authoritative contract?
- Does it explain changed limitations and safety boundaries?
- Is duplicated guidance replaced with a link to its source of truth?
