# Agentic Boiler

Agentic Boiler is a public, teaching-oriented Nx foundation for building agentic software with explicit
requirements, small composable projects, and repeatable engineering checks. It is intentionally small:
the `hello` library is a deterministic example, not a pretend production application.

## Design Intent

The repository helps a team move from idea to a reviewable implementation without losing the reasoning:

- **Contracts first:** behavior is described in accepted OpenSpec requirements and scenarios.
- **Bounded architecture:** Nx projects provide clear ownership and dependency boundaries.
- **Evidence over ceremony:** every change has executable tasks and recorded verification.
- **Safe automation:** agents can inspect and run bounded repository tasks, but do not receive credentials
  or implicit authority to publish, deploy, or act externally.
- **Portable foundations:** examples avoid provider lock-in, network calls, and secrets.

## Quick Start

```bash
npm ci
npm run check
```

Install the local hooks once per clone:

```bash
./scripts/install-git-hooks.sh
```

The `check` command runs strict OpenSpec validation, agent-harness and roadmap checks, documentation and
secret checks, then Nx formatting, linting, type checking, tests, and builds.

## Nx Workflow

```bash
npm exec nx show projects
npm exec nx graph
npm exec nx run hello:test
```

Project targets are intentionally explicit:

| Target      | Purpose                                       |
| ----------- | --------------------------------------------- |
| `lint`      | Static code-quality checks                    |
| `typecheck` | TypeScript validation without emitting output |
| `test`      | Deterministic project tests                   |
| `build`     | Compile and package project output            |

Use Nx targets rather than invoking project tooling directly. As the workspace grows, applications should
compose reusable libraries rather than placing domain logic in presentation projects.

## Spec-Driven Workflow

OpenSpec is the behavioral source of truth. The normal lifecycle is:

1. Read the relevant accepted specs and current implementation.
2. Create and strictly validate `openspec/changes/<name>/`.
3. Record architecture in `design.md` and ordered work in `tasks.md`.
4. Implement only the contract-covered behavior.
5. Run `npm run check` and record exact evidence.
6. Verify and archive the change after every task is complete.

The four change artifacts have distinct jobs: `proposal.md` explains why, `design.md` explains how,
`tasks.md` explains execution, and `specs/<capability>/spec.md` defines behavior. Plans teach sequencing;
they do not replace requirements.

See [`plans/spec-driven-workflow.md`](plans/spec-driven-workflow.md) and
[`docs/governance.md`](docs/governance.md) for the full workflow.

For the detailed directory map, authority boundaries, agent loop, harness adapters, and MCP boundary, see
[`docs/repository-orientation.md`](docs/repository-orientation.md).

Planning and dependency conventions are documented in
[`docs/dependency-patterns.md`](docs/dependency-patterns.md).

## Repository Map

| Path                | Responsibility                                         |
| ------------------- | ------------------------------------------------------ |
| `apps/`             | Future deployable applications                         |
| `packages/`         | Reusable libraries and domain logic; currently `hello` |
| `openspec/specs/`   | Accepted behavioral contracts                          |
| `openspec/changes/` | Proposed, not-yet-archived changes                     |
| `scripts/`          | Repository checks, hooks, and PR automation            |
| `.agent/`           | Canonical agent commands and skills                    |
| `docs/`             | Durable policy and contributor explanations            |
| `plans/`            | Teaching sequence and roadmap, not requirements        |
| `.github/`          | CI, issue templates, and pull-request guidance         |

## Contributing

Read [`AGENTS.md`](AGENTS.md), the relevant accepted spec, and [`CONTRIBUTING.md`](CONTRIBUTING.md)
before making a change. Pull requests should explain the contract, verification, skipped checks, and any
generated output. The repository is licensed under the [MIT License](LICENSE).
