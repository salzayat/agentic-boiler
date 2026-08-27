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
`CLAUDE.md` as symlinks so command and skill changes are made once.
