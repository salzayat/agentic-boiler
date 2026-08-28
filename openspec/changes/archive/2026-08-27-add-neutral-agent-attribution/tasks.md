# Tasks: Add Neutral Agent Attribution

## 1. Policy and guidance

- [x] 1.1 Add neutral contributor/reviewer attribution rules and the external-platform boundary to `AGENTS.md`.
- [x] 1.2 Add `docs/agent-attribution.md` with examples of allowed neutral labels and prohibited generated
      provider/commercial watermarks.
- [x] 1.3 Add the canonical shared neutral-attribution skill under `.agent/skills/`.
- [x] 1.4 Add the canonical `/agent-rule` command and skill with prior-context fallback when no parameter is
      provided.
- [x] 1.5 Link the policy from repository orientation and contributor guidance.

## 2. Executable discoverability

- [x] 2.1 Add a deterministic attribution-policy check and include it in `scripts/check.sh`.
- [x] 2.2 Verify the check does not reject factual provider names required by technical configuration docs.
      Evidence: the check validates policy structure only and `npm run check` passed with factual MCP
      configuration present.

## 3. Verification

- [x] 3.1 Strictly validate the OpenSpec change and run the harness topology check.
      Evidence: strict validation and `./scripts/check-harness.sh` passed.
- [x] 3.2 Run the attribution, documentation freshness, and formatting checks.
      Evidence: attribution, documentation freshness, and Prettier checks passed.
- [x] 3.3 Run `npm run check`, record evidence, and archive only after all tasks are complete.
      Evidence: `npm run check` passed before archival; archival follows this task.
