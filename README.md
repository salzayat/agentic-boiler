# Agentic Boiler

Agentic Boiler is a public, teaching-oriented Nx monorepo. It shows how to build agentic software with
the same discipline a well-run engineering team already uses: specs before code, clear ownership boundaries,
and evidence instead of trust. `hello` is a small deterministic library that makes the structure and feedback
loop visible — it isn't a stand-in for a real product. `greeter` depends on `hello`, and exists to show a
second package working: dependency resolution and sequencing in running code, not just in a diagram.

Forking this to start your own project? Read [`TEMPLATE.md`](TEMPLATE.md) first.

An agent here is a contributor, not an operator with free rein. Accepted OpenSpec requirements say what the
system should do. Nx projects say where the implementation lives. Repository rules say how the work gets
done. Automated checks provide the evidence that it's ready for review. The agent harness gives agents
reusable commands and skills, and its MCP access is read-only or limited to documented workspace operations.
Publishing, deploying, and touching credentials stay with a human.

The workflow mirrors a real engineering lifecycle: discovery, proposal, design, planning, implementation,
verification, review, archival. The same things that make that lifecycle trustworthy on a human team — clear
dependencies, owned boundaries, review that doesn't care who wrote the code, explicit acceptance criteria,
recorded evidence — apply here too. Agents can move faster through the loop. They don't get to skip the parts
that make the loop trustworthy.

The result is a small lab for loop engineering: state the intended behavior, make the smallest change that
satisfies it, get fast local feedback, enforce the same quality gates on every change, and feed what you
learn back into the next decision. The repo stays small and legible on purpose, so the lessons scale to
bigger agentic monorepos without hiding how the mechanics work. It's a work in progress, and deliberately
so: today's `hello`/`greeter` pair is a starting workspace, not the finished shape. Expect more examples and
deeper integrations to land here over time, each arriving through the same spec-driven loop this repo
teaches. The roadmap and OpenSpec change history show where it's headed, and each accepted spec turns a
planned capability into a step you can hold accountable.

## Design Intent

The repository helps a team move from idea to a reviewable implementation without losing the reasoning:

- **Contracts first.** Behavior lives in accepted OpenSpec requirements and scenarios, not in someone's
  head.
- **Bounded architecture.** Nx projects draw clear ownership and dependency lines.
- **Evidence over ceremony.** Every change ships with executable tasks and recorded verification.
- **Safe automation.** Agents can inspect and run bounded repository tasks. They don't get credentials or
  standing authority to publish, deploy, or act externally.
- **Portable foundations.** Examples avoid provider lock-in, network calls, and secrets.

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

## Key Commands

The repository keeps its common engineering actions executable and visible:

| Command                                        | What it does                                                                                                               |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `npm run check`                                | Runs the complete local quality gate: specs, harness, governance, docs, secrets, formatting, Nx checks, tests, and builds. |
| `npm exec nx show projects`                    | Lists the projects known to the Nx workspace.                                                                              |
| `npm exec nx graph`                            | Opens the workspace project and dependency graph.                                                                          |
| `npm exec nx run hello:test`                   | Runs the deterministic test target for the example library.                                                                |
| `npm exec nx run greeter:test`                 | Runs the test target for the second example library, which depends on `hello`.                                             |
| `npm exec openspec -- validate --all --strict` | Strictly validates every accepted and active OpenSpec artifact.                                                            |
| `./scripts/pr.sh`                              | Runs guarded checks, creates a commit, pushes a branch, and opens a pull request.                                          |

The agent harness adds workflow commands for the spec and review loop. Use `/next` to select and implement
the next dependency-ready roadmap change, `/verify-change <name>` to verify an active change without mutating
it, `/archive-change <name>` to archive a fully verified change, and `/pr` to create a guarded commit and pull
request through `scripts/pr.sh`. These commands are authorization-aware: they do not grant an agent permission
to publish, deploy, or perform external actions without an explicit request.

## Skill Library

The reusable agent skill library lives in the canonical `.agent/skills/` directory. Skills provide focused
working methods rather than hidden authority; discovery adapter paths such as `.opencode/skills/` and
`.claude/skills/` point back to this shared library.

| Skill                            | Focus                                                                 |
| -------------------------------- | --------------------------------------------------------------------- |
| `nx-workspace`                   | Explore projects, targets, dependencies, and workspace configuration. |
| `nx-run-tasks`                   | Run Nx targets and diagnose task failures.                            |
| `nx-generate`                    | Scaffold Nx projects and code through generators.                     |
| `nx-ai-agent-skills`             | Apply Nx-oriented practices when working with agents.                 |
| `openspec-change`                | Create a contract-backed OpenSpec change.                             |
| `openspec-contract-audit`        | Audit an active change for contract completeness and grounding.       |
| `openspec-lifecycle`             | Verify and archive changes with evidence and repository checks.       |
| `roadmap-execution`              | Select the next dependency-ready roadmap change.                      |
| `pull-request-automation`        | Prepare safe commit and pull-request automation.                      |
| `repository-harness-audit`       | Review commands, skills, adapters, and harness governance.            |
| `link-workspace-packages`        | Link packages in the npm workspace correctly.                         |
| `monitor-ci`                     | Monitor bounded CI and self-healing workflow status.                  |
| `agent-rule`                     | Turn repository requests into durable agent rules.                    |
| `neutral-repository-attribution` | Keep repository-produced documentation and reports neutral.           |
| `next-best-practices`            | Guide Next.js application and App Router work.                        |
| `react-best-practices`           | Guide React component, hook, and rendering work.                      |
| `nx-plugins`                     | Discover and add Nx technology plugins.                               |
| `nx-import`                      | Bring existing repositories into an Nx workspace.                     |

Keep new reusable skills in `.agent/skills/`, document their boundaries, and expose them through the existing
discovery symlinks rather than copying divergent versions into adapter directories.

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

| Path                | Responsibility                                                                  |
| ------------------- | ------------------------------------------------------------------------------- |
| `apps/`             | Future deployable applications                                                  |
| `packages/`         | Reusable libraries and domain logic; `hello` and `greeter` (depends on `hello`) |
| `openspec/specs/`   | Accepted behavioral contracts                                                   |
| `openspec/changes/` | Proposed, not-yet-archived changes                                              |
| `scripts/`          | Repository checks, hooks, and PR automation                                     |
| `.agent/`           | Canonical agent commands and skills                                             |
| `docs/`             | Durable policy and contributor explanations                                     |
| `plans/`            | Teaching sequence and roadmap, not requirements                                 |
| `.github/`          | CI, issue templates, and pull-request guidance                                  |

## Contributing

Read [`AGENTS.md`](AGENTS.md), the relevant accepted spec, and [`CONTRIBUTING.md`](CONTRIBUTING.md)
before making a change. Pull requests should explain the contract, verification, skipped checks, and any
generated output. The repository is licensed under the [MIT License](LICENSE).
