# Using This Repository As A Template

This checklist is for the moment right after you fork or clone this repository to start your own
spec-driven, agent-governed project. It is a one-time setup path, in order. `CONTRIBUTING.md` covers the
ongoing change workflow you'll use afterward.

## 1. Rename the identity strings

This project's name and repository are hard-coded in a few places. Update each of these before anything
else, so later commands, `npm install`, and generated links refer to your project instead of this one:

| File           | Field(s)                                      | Current value                                   |
| -------------- | --------------------------------------------- | ----------------------------------------------- |
| `package.json` | `name`                                        | `spec-loop`                                     |
| `package.json` | `repository.url`                              | `git+https://github.com/salzayat/spec-loop.git` |
| `package.json` | `bugs.url`                                    | `https://github.com/salzayat/spec-loop/issues`  |
| `package.json` | `homepage`                                    | `https://github.com/salzayat/spec-loop#readme`  |
| `README.md`    | Title (`# Spec Loop`) and opening description | —                                               |

## 2. Replace the teaching examples

`packages/hello` and `packages/greeter` are deterministic, dependency-linked example libraries built to
teach the repository's structure — not a foundation to build a real project on. Every tracked file meant to
be replaced or substantially adapted carries a literal `TEMPLATE:REPLACE` marker comment. Find them all:

```bash
grep -rn TEMPLATE:REPLACE packages/
```

Replace `packages/hello`'s implementation and test with your first domain capability, and either replace
`packages/greeter` with your second capability (keeping the same dependency-on-the-first pattern) or delete
it if your project doesn't need a second package yet. Update `openspec/specs/repository-foundation/spec.md`
to describe your capability's actual contract instead of `greet`/`announce`.

## 3. Verify the workspace

```bash
npm ci
./scripts/install-git-hooks.sh
npm run check
```

`npm run check` must pass before you build anything else — it's the same gate this repository's own CI
runs, and it validates specs, harness wiring, docs freshness, secrets, formatting, types, tests, and
builds.

## 4. Propose your first domain change

Once the workspace is clean and renamed, stop editing example code directly and start using the OpenSpec
workflow this repository is built to teach. Use the `/roadmap` command (or the `roadmap-execution` skill)
to add your first real capability, or read [`docs/repository-orientation.md`](docs/repository-orientation.md)
for the full agent loop: propose, validate, implement the smallest contract-covered slice, verify, archive.

From here, [`CONTRIBUTING.md`](CONTRIBUTING.md) and [`docs/governance.md`](docs/governance.md) govern how
work proceeds.
