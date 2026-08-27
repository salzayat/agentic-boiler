# Agent Instructions

## Mission

This repository is a teaching-oriented Nx boilerplate for building agentic software with explicit
requirements, small composable projects, and reproducible checks.

## Workflow

- Read the relevant `openspec/specs/` and active change under `openspec/changes/` before coding.
- Put behavior in specs, architecture in `design.md`, and execution steps in `tasks.md`.
- Keep examples deterministic and free of network calls or credentials.
- Prefer Nx generators and targets over hand-written workspace wiring.
- Keep application logic independent from report and presentation code.
- Update documentation when commands, outputs, or workflows change.
- Do not commit credentials, environment files, generated output, or dependency directories.

## Verification

Before considering a change complete, run:

```bash
npm run format:check
npm run typecheck
npm run lint
npm run test
npm run build
```

The examples must remain runnable from a clean checkout with `npm ci`.

The shared agent harness is canonical under `.agent/`. Keep `.opencode/`, `.claude/`, `.agents`, and
`CLAUDE.md` as symlinks so command and skill changes are made once. Agent configuration is an adapter,
not an authority grant: keep MCP access read-only or bounded to documented Nx operations.

<!-- nx configuration start-->
<!-- Leave the start & end comments to automatically receive updates. -->

## General Guidelines for working with Nx

- For navigating/exploring the workspace, invoke the `nx-workspace` skill first - it has patterns for querying projects, targets, and dependencies
- When running tasks (for example build, lint, test, e2e, etc.), always prefer running the task through `nx` (i.e. `nx run`, `nx run-many`, `nx affected`) instead of using the underlying tooling directly
- Prefix nx commands with the workspace's package manager (e.g., `pnpm nx build`, `npm exec nx test`) - avoids using globally installed CLI
- You have access to the Nx MCP server and its tools, use them to help the user
- For Nx plugin best practices, check `node_modules/@nx/<plugin>/PLUGIN.md`. Not all plugins have this file - proceed without it if unavailable.
- NEVER guess CLI flags - always check nx_docs or `--help` first when unsure

## Scaffolding & Generators

- For scaffolding tasks (creating apps, libs, project structure, setup), ALWAYS invoke the `nx-generate` skill FIRST before exploring or calling MCP tools

## When to use nx_docs

- USE for: advanced config options, unfamiliar flags, migration guides, plugin configuration, edge cases
- DON'T USE for: basic generator syntax (`nx g @nx/react:app`), standard commands, things you already know
- The `nx-generate` skill handles generator discovery internally - don't call nx_docs just to look up generator syntax

<!-- nx configuration end-->
