#!/bin/sh
set -eu

fail() {
  printf '%s\n' "$1" >&2
  exit 1
}

[ -f docs/dependency-patterns.md ] || fail "Missing dependency pattern documentation"
[ -f plans/roadmap.md ] || fail "Missing roadmap"
[ -f packages/hello/src/index.ts ] || fail "Missing current example implementation"
[ -f packages/hello/src/index.test.ts ] || fail "Missing current example test"

grep -q '^## OpenSpec Dependencies$' docs/dependency-patterns.md \
  || fail "Dependency documentation must define the OpenSpec dependency convention"
grep -q 'add-repository-evolution-markers' plans/roadmap.md \
  || fail "Roadmap must reference the repository evolution change"
grep -q 'TEMPLATE:REPLACE' packages/hello/src/index.ts \
  || fail "Example implementation is missing TEMPLATE:REPLACE marker"
grep -q 'TEMPLATE:REPLACE' packages/hello/src/index.test.ts \
  || fail "Example test is missing TEMPLATE:REPLACE marker"

printf '%s\n' "Repository convention check passed"
