# Fix Roadmap Command Context

## Why

The canonical roadmap command currently requires a concrete capability description, phase position, and
dependencies from `$ARGUMENTS` (`.agent/commands/roadmap.md:6-20`). When the command is invoked without
arguments, it asks the user to restate context even when the preceding conversation already contains a
specific improvement request. This breaks the intended conversational agent loop.

## What Changes

- Make `/roadmap` use the immediately preceding user request as its capability context when `$ARGUMENTS` is
  empty.
- Require the agent to infer phase position and dependencies from that context and repository state when
  they are determinable, asking one concise question only for genuinely unresolved ambiguity.
- Preserve explicit arguments as an override and retain all existing validation, dependency, and safety rules.

## Non-Goals

- No automatic roadmap entry, OpenSpec change, commit, pull request, or archive occurs without the command's
  normal workflow and user authorization.
- No change to `/next`, `/pr`, or other harness commands.
- No inference of behavioral requirements from plans or conversation when accepted specs are applicable.

## Dependencies

None. This change updates the canonical command behavior directly.
