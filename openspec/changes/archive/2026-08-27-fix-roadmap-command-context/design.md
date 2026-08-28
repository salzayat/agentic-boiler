# Design: Fix Roadmap Command Context

## Conversation context is the default input

The command template already exposes `$ARGUMENTS` (`.agent/commands/roadmap.md:9-13`) and its workflow
requires a concrete capability description (`.agent/commands/roadmap.md:17-20`). The command should explicitly
define empty arguments as a request to use the immediately preceding user message, rather than treating an
empty invocation as no request. Explicit arguments remain authoritative when supplied.

## Repository evidence still controls selection

The existing workflow requires reading the roadmap, governance, accepted specs, and active/archive changes
(`.agent/commands/roadmap.md:17-29`). Context reuse only supplies the candidate capability; it does not
replace checking for an existing exact change, determining dependency order, or validating the plan. The
agent must ask a concise question only when phase or dependency position cannot be safely established.

## Dependencies

None. This is a harness command correction and does not depend on a later application capability.
