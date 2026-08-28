# Add Neutral Agent Attribution

## Why

The repository centralizes agent operating rules in `AGENTS.md:9-18` and shares agent behavior through
`.agent/commands/` and `.agent/skills/` (`AGENTS.md:60-68`), but it has no policy governing commercial
identity, provider branding, or generated-by watermarks in repository output. As a result, generated reviews,
reports, and documentation could introduce provider or commercial attribution even when the repository only
needs a neutral contributor or reviewer role.

Repository policy can govern tracked files, commits, reviews, and reports, but it cannot remove branding added
by an external Claude UI, API gateway, or organization-managed platform. That boundary should be explicit so
agents do not promise control the repository does not possess.

## What Changes

- Add a neutral-attribution requirement covering repository-produced agent output.
- Add shared instructions and a canonical skill for neutral contributor/reviewer language.
- Add a canonical `/agent-rule` command and skill that can turn a user request into a durable `AGENTS.md`
  rule, reusing the immediately preceding request when no parameter is supplied.
- Document the external-platform boundary and preserve existing human attribution and licensing.
- Add an executable convention check that ensures the policy remains discoverable.

## Non-Goals

- No attempt to alter Claude, Anthropic, GitHub, or other external UI branding or platform metadata.
- No removal or rewriting of existing human-authored copyright, license, contributor, or reviewer records.
- No provider integration, credential, remote service, or network-dependent enforcement.
- No requirement to conceal factual provider names in configuration or technical documentation where they are
  necessary to describe an integration boundary.

## Dependencies

None. This policy uses the existing shared harness and repository governance structure.
