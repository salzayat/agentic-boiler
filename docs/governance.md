# Repository Governance

## Source Of Truth

Behavior belongs in OpenSpec. Architecture belongs in `design.md`. Execution steps and completion status
belong in `tasks.md`. README and `docs/` explain the workflow but do not replace the contract.

## Quality Gates

Nx owns project targets: `lint`, `typecheck`, `test`, and `build`. The root `scripts/check.sh` composes
OpenSpec validation, harness topology, archive completeness, roadmap freshness, documentation freshness,
secret scanning, and the Nx quality targets. CI invokes the same `npm run check` command after `npm ci`.

## Public Repository Boundaries

- Examples must be deterministic and must not require network access or credentials.
- Never commit `.env` files, tokens, private keys, generated `dist/`, `.nx/`, coverage, or run artifacts.
- A passing automated check is evidence of the check, not proof that an architectural decision is correct.
- New behavior requires an OpenSpec change before implementation.

## Review Checklist

- Does the implementation satisfy an accepted requirement and its scenarios?
- Does architecture have a matching `design.md` decision?
- Do changed commands, layouts, and outputs have current docs?
- Does the PR record exact verification and skipped checks?
- Are new dependencies lockfile-reproducible?

## Harness Boundary

`.agent/commands/` and `.agent/skills/` are canonical. `.opencode/`, `.claude/`, and `.agents` are
discovery symlinks. Agent configuration may expose repository inspection and bounded Nx operations, but
must not check in credentials or grant unrestricted external authority.

## OpenSpec Lifecycle

Run `npm exec openspec -- validate <change> --strict` while drafting. Complete every task and record
verification before archiving. The archive check prevents accepted specs from lagging behind completed work.
