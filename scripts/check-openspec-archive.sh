#!/bin/sh
set -eu

# Warn-only so a new repository can introduce OpenSpec changes incrementally.
# Promote this to a hard failure once the project has an established archive flow.

if ! command -v openspec >/dev/null 2>&1; then
  printf '%s\n' "openspec not found; skipping archive-completeness check"
  exit 0
fi

unarchived=$(openspec list --json | python3 -c '
import json, sys

data = json.load(sys.stdin)
names = sorted(
    c["name"]
    for c in data["changes"]
    if c["totalTasks"] > 0 and c["completedTasks"] == c["totalTasks"]
)
print("\n".join(names))
')

if [ -n "$unarchived" ]; then
  cat >&2 <<EOF
The following OpenSpec changes have every task checked but have not been
archived, so openspec/specs/ does not yet reflect them:

$unarchived

Run \`openspec archive <change-name>\` for each one before merging. This
folds the change's spec delta into openspec/specs/ and moves the change
to openspec/changes/archive/.
EOF
fi

printf '%s\n' "OpenSpec archive-completeness check passed (warn-only)"
