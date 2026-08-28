#!/bin/sh
set -eu

unarchived=$(npm exec openspec -- list --json | python3 -c '
import json, sys
data = json.load(sys.stdin)
for change in sorted(data["changes"], key=lambda item: item["name"]):
    if change["totalTasks"] > 0 and change["completedTasks"] == change["totalTasks"]:
        print(change["name"])
')

if [ -n "$unarchived" ]; then
  printf '%s\n' "Completed OpenSpec changes must be archived before merge:" >&2
  printf '%s\n' "$unarchived" >&2
  exit 1
fi

printf '%s\n' "OpenSpec archive-completeness check passed"
