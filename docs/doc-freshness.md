# Documentation Freshness

Documentation and specs are part of implementation. A change is incomplete when behavior, commands,
configuration, or project layout has changed but repository guidance is stale.

The `scripts/check-docs.sh` gate requires implementation and workflow changes to include a related
OpenSpec, README, governance, or agent-guidance update. It prevents omission; reviewers still verify
that the documentation is accurate.
