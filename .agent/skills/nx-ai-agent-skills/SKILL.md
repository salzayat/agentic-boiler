---
name: nx-ai-agent-skills
description: Use when exploring an Nx workspace, generating projects or libraries, running Nx tasks, debugging Nx target failures, or preparing this repository for its future Nx monorepo layout. Based on Nx AI agent skills guidance.
metadata:
  source: https://nx.dev/blog/nx-ai-agent-skills
  upstream: https://github.com/nrwl/nx-ai-agents-config
---

# Nx AI Agent Skills

Use this skill for Nx monorepo work. This repository is expected to evolve into an Nx workspace, so prefer Nx-native exploration and task execution once Nx is introduced.

## Configure Agents

When an Nx workspace exists, configure AI agent support with:

```bash
npx nx configure-ai-agents
```

This can install Nx agent skills, Nx MCP configuration, and shared agent guidance for supported tools, including OpenCode.

## Explore The Workspace

- Use `nx show projects` to list projects.
- Use `nx show projects --json` for machine-readable project lists.
- Use `nx show project <name> --json` for full resolved project configuration.
- Do not rely only on `project.json`; plugin inference can add targets not present in the file.
- Use `nx graph --print` to inspect dependencies programmatically.
- Read `nx.json` for workspace-level defaults, named inputs, plugins, and generator defaults.

Useful commands:

```bash
nx show projects
nx show projects --type app
nx show projects --withTarget test
nx show project <project-name> --json
nx graph --print
```

## Run Tasks

- Use `nx run <project>:<target>` for a single task.
- Use `nx run-many -t <targets>` for multiple projects.
- Use `nx affected -t <targets>` to limit work to changed projects and their dependents.
- Use `--configuration=<name>` when a production, CI, or other explicit configuration is needed.
- Use `--verbose` when debugging target failures.
- Avoid bypassing cache unless there is a concrete reason; use `--skipNxCache` only when validating a suspected stale cache problem.

Examples:

```bash
nx run research-dashboard:build
nx run-many -t lint test typecheck
nx affected -t build test lint --base=main --head=HEAD
```

## Generate Code

- Prefer generators over hand-written scaffolding when adding apps, libraries, and repeated structures.
- Prefer local workspace generators over plugin generators when both apply.
- Always run generators with `--no-interactive`.
- Read generator help and, when feasible, generator source before running it.
- Match existing naming, tags, directories, test runners, and build tooling.
- Dry-run first to confirm file placement.

Example workflow:

```bash
npx nx list
npx nx list @nx/react
npx nx g @nx/react:library --help
npx nx g @nx/react:library --directory=packages/frontend/my-lib --dry-run --no-interactive
npx nx g @nx/react:library --directory=packages/frontend/my-lib --no-interactive
```

## Library Defaults

- Default to non-buildable libraries for internal monorepo code.
- Use buildable libraries when publishing, cross-repo sharing, or a stable cache boundary is required.
- If buildability is unclear and materially affects structure, ask the user before generating.

## Link Workspace Packages

- Use the workspace package protocol selected by the package manager.
- Check the lockfile and root `package.json` before adding dependencies.
- Keep generated package names and import paths consistent with existing workspace conventions.

## CI And Nx Cloud

- Use Nx affected commands for PR-scoped checks.
- If Nx Cloud is configured, use available CI status and failure context before guessing at fixes.
- Keep iterating on local or CI failures until lint, typecheck, test, and build targets are green or a real blocker is identified.

## Repository-Specific Boundaries

- Keep strategy logic and simulation behavior out of frontend apps.
- Frontend projects may render immutable reports and documented outputs.
- Governance, OpenSpec contracts, and research reproducibility rules still apply inside an Nx workspace.
- For workflow, config, generated output, or command changes, run the repository documentation freshness checks in addition to Nx targets.
