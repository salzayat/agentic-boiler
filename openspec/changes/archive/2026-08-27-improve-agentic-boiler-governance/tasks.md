# Tasks

## Agent Harness

- [x] Document the canonical agent tree and all harness symlink targets.
- [x] Add reproducible Nx agent/MCP configuration for supported local harnesses.
- [x] Remove or generalize copied domain-specific language from shared skills.

## Quality And Security

- [x] Add a real ESLint target and test it through the root check.
- [x] Pin CI installations for OpenSpec and gitleaks, or fail explicitly when unavailable.
- [x] Resolve or document the Nx dependency audit findings without using an unsafe forced upgrade.

## Public Repository

- [x] Add license, security policy, code of conduct, and issue/PR templates.
- [x] Add a worked OpenSpec change example and explain its lifecycle in `plans/`.

## Verification

- [x] Run `npm exec openspec -- validate improve-agentic-boiler-governance --strict`.
- [x] Run `npm run check` from a clean install.
- [x] Verify all canonical harness symlinks and MCP configuration paths resolve.
