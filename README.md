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

The repository contains no network-dependent example and requires no credentials.

## Quick Start

```bash
npm ci
npm run test
```

Run the complete quality gate:

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

The initial workspace check covers only Nx quality targets; later governance PRs extend it with
OpenSpec, harness, documentation, and secret checks.

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
