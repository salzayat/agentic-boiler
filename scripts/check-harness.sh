#!/bin/sh
set -eu

fail() {
  printf '%s\n' "$1" >&2
  exit 1
}

[ -d .agent/commands ] || fail "Missing canonical .agent/commands directory"
[ -d .agent/skills ] || fail "Missing canonical .agent/skills directory"

for link in .opencode/command .opencode/skills .claude/commands .claude/skills .agents CLAUDE.md; do
  [ -L "$link" ] || fail "$link must be a symlink to shared harness content"
  [ -e "$link" ] || fail "$link is a dangling symlink"
done

for command in .agent/commands/*.md; do
  grep -q '^description:' "$command" || fail "$command is missing command front matter"
done

for skill in .agent/skills/*; do
  [ -d "$skill" ] || continue
  [ -f "$skill/SKILL.md" ] || fail "$skill is missing SKILL.md"
  grep -q '^name:' "$skill/SKILL.md" || fail "$skill/SKILL.md is missing skill front matter"
done

printf '%s\n' "Agent harness check passed"
