# Agentic Boiler

An intentionally small Nx workspace for learning how to build agentic software with explicit
requirements, deterministic examples, and repeatable quality gates.

## What This Demonstrates

- Nx integrated workspace structure and project targets
- A typed, tested example under `packages/hello`
- OpenSpec requirements under `openspec/specs/`
- Repository-level agent guidance in `AGENTS.md`
- Separate formatting, type checking, linting, test, and build checks
- CI that runs the same checks as local development
- A shared agent harness with bounded, documented tooling access
- Documentation freshness, secret scanning, roadmap drift, and OpenSpec lifecycle checks

The repository contains no network-dependent example and requires no credentials.

## Quick Start

```bash
npm ci
npm run test
```

Install the local hooks once per clone to run the gate before every commit:

```bash
./scripts/install-git-hooks.sh
```

Run the complete quality gate. It validates OpenSpec, harness links, roadmap status, documentation
freshness, secrets, formatting, linting, types, tests, and builds:

```bash
npm run format:check
npm run typecheck
npm run lint
npm run test
npm run build
```

Or run the same aggregate gate used by CI and the pre-commit hook:

```bash
npm run check
```

The aggregate check is the same command used by CI and the pre-commit hook.

Useful Nx commands:

```bash
npx nx show projects
npx nx graph
npx nx run hello:test
```

## Spec-Driven Workflow

Read the relevant accepted spec before changing behavior. For a new capability, create a change
under `openspec/changes/<change-name>/` with:

- `proposal.md`: why the change is needed and its scope
- `design.md`: implementation architecture and important decisions
- `tasks.md`: ordered, verifiable execution steps
- `specs/<capability>/spec.md`: requirements and scenarios

Keep behavioral contracts in specs, implementation structure in design documents, and progress in
task lists. Update documentation when commands or outputs change.

The normal lifecycle is:

1. Read accepted specs and the current implementation.
2. Draft and strictly validate an active change.
3. Implement the smallest contract-covered slice.
4. Run `npm run check` and record evidence in `tasks.md` and the pull request.
5. Verify the change without changing it, then archive it only when every task is complete.

The active `improve-agentic-boiler-governance` change is a worked example of this lifecycle.

## Pull Requests

Use the included template to identify the OpenSpec contract, exact verification commands, skipped checks,
and generated-output impact. The guarded helper can create a branch, run checks, commit, push, and open a
PR after GitHub CLI authentication:

```bash
./scripts/pr.sh --type chore --scope repo --message "describe the change" \
  --branch chore/describe-change --all
```

## Repository Map

| Path                 | Purpose                                     |
| -------------------- | ------------------------------------------- |
| `packages/`          | Nx libraries and reusable application logic |
| `openspec/specs/`    | Accepted behavioral contracts               |
| `openspec/changes/`  | Proposed changes awaiting implementation    |
| `docs/`              | Governance and contributor guidance         |
| `.github/workflows/` | Automated quality gates                     |

## License

MIT
