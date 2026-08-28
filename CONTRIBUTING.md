# Contributing

## Development loop

1. Start with a small OpenSpec change when behavior or workflow is changing.
2. Implement the smallest change that satisfies the accepted scenarios.
3. Implement the smallest contract-covered slice.
4. Run the repository checks before opening a pull request.
5. Update the relevant documentation and task checklist in the same change.

Use `npm exec nx graph` to inspect project dependencies and `npm exec nx show projects` to list projects.

Install the repository Git hooks once per clone:

```bash
./scripts/install-git-hooks.sh
```

Run the full repository gate before handoff:

```bash
./scripts/check.sh
```

Commands live in `.agent/commands/` and skills live in `.agent/skills/`; `.opencode/` and `.claude/`
symlink to those canonical directories. The `.agents` symlink supports tools that discover plural
agent directories. Run `./scripts/check-harness.sh` to verify the topology.

## Pull requests

Pull requests should explain the behavioral contract, verification commands, and any intentionally
deferred work. Use the pull request template. Never commit credentials, generated dependency directories,
or unexplained fixtures. Do not bypass hooks with `--no-verify`.
