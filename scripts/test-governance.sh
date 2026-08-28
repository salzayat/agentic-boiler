#!/bin/sh
set -eu

temporary_root=$(mktemp -d)
trap 'rm -rf "$temporary_root"' EXIT

reset_fixture() {
  rm -rf "$temporary_root/openspec" "$temporary_root/plans"
  mkdir -p "$temporary_root/openspec/changes/archive" "$temporary_root/plans"
}

expect_failure() {
  if REPOSITORY_ROOT="$temporary_root" ./scripts/check-dependencies.sh >/dev/null 2>&1; then
    printf '%s\n' "$1" >&2
    exit 1
  fi
}

reset_fixture
mkdir -p "$temporary_root/openspec/changes/archive/2026-08-27-a"
printf '%s\n' '# A' > "$temporary_root/openspec/changes/archive/2026-08-27-a/proposal.md"
mkdir -p "$temporary_root/openspec/changes/b"
printf '%s\n' '# B' '' '## Dependencies' '' '- `a`' > "$temporary_root/openspec/changes/b/proposal.md"
printf '%s\n' '| Phase | Governing changes | Status |' '| --- | --- | --- |' '| A | `a` | Complete |' '| B | `b` | Pending |' > "$temporary_root/plans/roadmap.md"
REPOSITORY_ROOT="$temporary_root" ./scripts/check-dependencies.sh

reset_fixture
mkdir -p "$temporary_root/openspec/changes/unknown"
printf '%s\n' '# Unknown' '' '## Dependencies' '' '- `missing`' > "$temporary_root/openspec/changes/unknown/proposal.md"
expect_failure 'Expected unknown dependency failure'

reset_fixture
mkdir -p "$temporary_root/openspec/changes/c" "$temporary_root/openspec/changes/b"
printf '%s\n' '# C' '' '## Dependencies' '' 'None' > "$temporary_root/openspec/changes/c/proposal.md"
printf '%s\n' '# B' '' '## Dependencies' '' '- `c`' > "$temporary_root/openspec/changes/b/proposal.md"
printf '%s\n' '| Phase | Governing changes | Status |' '| --- | --- | --- |' '| C | `c` | In progress |' '| B | `b` | Pending |' > "$temporary_root/plans/roadmap.md"
expect_failure 'Expected unready predecessor failure'

reset_fixture
mkdir -p "$temporary_root/openspec/changes/archive/2026-08-27-a" "$temporary_root/openspec/changes/b"
printf '%s\n' '# A' > "$temporary_root/openspec/changes/archive/2026-08-27-a/proposal.md"
printf '%s\n' '# B' '' '## Dependencies' '' '- `a`' > "$temporary_root/openspec/changes/b/proposal.md"
printf '%s\n' '| Phase | Governing changes | Status |' '| --- | --- | --- |' '| B | `b` | Pending |' '| A | `a` | Complete |' > "$temporary_root/plans/roadmap.md"
expect_failure 'Expected misordered dependency failure'

reset_fixture
mkdir -p "$temporary_root/openspec/changes/missing"
printf '%s\n' '# Missing' > "$temporary_root/openspec/changes/missing/proposal.md"
expect_failure 'Expected missing dependency section failure'

printf '%s\n' 'Governance fixture tests passed'
