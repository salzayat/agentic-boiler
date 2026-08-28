# Documentation Freshness

Documentation and specs are part of implementation. A change is incomplete when behavior, commands,
configuration, or project layout has changed but repository guidance is stale.

The `scripts/check-docs.sh` gate requires implementation and workflow changes to include a related
OpenSpec, README, governance, or agent-guidance update. It prevents omission; reviewers still verify
that the documentation is accurate.

The check compares staged files locally, or a `CHECK_DIFF_RANGE` in CI. This makes documentation review
diff-aware while keeping ordinary working-tree checks fast. Changes to code, scripts, hooks, CI,
dependencies, Nx configuration, or project layout should update user-facing docs or the governing OpenSpec
change in the same pull request.
