# Tasks

## Agent Harness

- [ ] Document the canonical agent tree and all harness symlink targets.
- [ ] Add reproducible Nx agent/MCP configuration for supported local harnesses.
- [ ] Remove or generalize copied domain-specific language from shared skills.

## Quality And Security

- [ ] Add a real ESLint target and test it through the root check.
- [ ] Pin CI installations for OpenSpec and gitleaks, or fail explicitly when unavailable.
- [ ] Resolve or document the Nx dependency audit findings without using an unsafe forced upgrade.

## Public Repository

- [ ] Add license, security policy, code of conduct, and issue/PR templates.
- [ ] Add a worked OpenSpec change example and explain its lifecycle in `plans/`.

## Verification

- [ ] Run `openspec validate improve-agentic-boiler-governance --strict`.
- [ ] Run `npm run check` from a clean install.
- [ ] Verify all canonical harness symlinks and MCP configuration paths resolve.
