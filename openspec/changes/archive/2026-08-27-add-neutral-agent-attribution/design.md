# Design: Add Neutral Agent Attribution

## Shared policy is the source for all agents

`AGENTS.md:60-68` establishes `.agent/` as the canonical harness and `CLAUDE.md` as a symlink to the shared
instructions. Put the default policy in `AGENTS.md` and explain it in `docs/agent-attribution.md`; add a
canonical `.agent/skills/neutral-repository-attribution/SKILL.md` for tasks that produce reviews, reports, or
documentation. Do not create a Claude-only copy under `.claude/`.

## Neutral output is distinct from preserved authorship

The policy applies to agent-generated repository content and role labels. It must not rewrite existing human
authorship or license records. This preserves legal and historical attribution while preventing a model or
commercial provider from being presented as a repository contributor or reviewer.

## The external boundary is documented, not falsely automated

The current repository governance already states that agent configuration is bounded (`docs/governance.md:30-38`)
but does not address UI-injected branding. The documentation will state that repository rules can govern
tracked content and agent messages supplied to repository workflows, while external Claude platform watermarks
require administrator or product settings outside this repository.

## A presence check protects discoverability

The aggregate checks are assembled in `scripts/check.sh:4-14`. Add a deterministic check for the policy,
canonical skill, and documentation links. It will detect accidental removal or harness divergence without
pretending that a shell script can inspect branding injected after repository content leaves the workspace.

## Rule updates target shared guidance and reuse prior context

Add `.agent/commands/agent-rule.md` and `.agent/skills/agent-rule/SKILL.md` as canonical harness content. The
command and skill both define explicit arguments as the preferred input and the immediately preceding user
request as the default when no argument is supplied. They update only `AGENTS.md`, after reading accepted
specs and active changes, so `CLAUDE.md` and other adapters inherit the rule without copied content.
