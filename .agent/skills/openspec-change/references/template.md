# OpenSpec Change File Skeletons

Four files, always in this shape. `<name>` is the kebab-case change name; `<capability>` is the
capability directory name under `openspec/specs/` (may be new or existing).

```
openspec/changes/<name>/
├── proposal.md
├── design.md
├── tasks.md
└── specs/<capability>/spec.md
```

## proposal.md

```markdown
# <Title Case Name>

## Why

<1-3 short paragraphs. State the concrete problem, citing real file:line evidence — "X does Y
(file.py:12-34), which means Z" — not a general statement of good practice. If this is a bug fix, describe
the failure scenario. If this is a new capability, describe what's missing and why it matters now.>

## What Changes

- <Bullet per concrete change. Each bullet should be independently checkable — a reviewer should be able
  to point at a line of a future diff and say "this bullet, done or not.">
- <If this depends on another change, either pending or already accepted, name it explicitly here or in
  design.md, and say what it needs from that change (a new type it extends, an artifact it reads).>

## Non-Goals

- <Each one names something a reader can go verify is absent — "no live-order placement," "no change to
  replay_authority semantics," "does not modify v1 artifacts." Avoid vague negatives like "doesn't
  overreach.">
```

**Worked example** (`add-hypothesis-trial-registration`, this repo):

> AI-assisted drafting can otherwise create an uncounted sequence of related candidates. The platform
> needs an append-only control-plane record before context selection, provider invocation, compilation,
> or replay so family budgets, lineage, and multiplicity accounting include every attempted hypothesis.
>
> **What Changes** lists: add immutable checksum-bound `HypothesisFamily` and trial registrations; require
> registration before drafting/replay can begin; derive family membership from verified predeclared
> artifacts; record every terminal outcome without deleting history.
>
> **Non-Goals** lists: selecting a strategy or evaluating P&L; automatically creating trials or invoking a
> provider; defining the provider context or DSL grammar (each points at a _different_ change's scope,
> making the boundary between changes explicit).

## design.md

```markdown
# Design: <Title Case Name>

## <Section per non-obvious decision>

<Explain the reasoning, not just the mechanism. Reference real code: "`module.py:44-58` already does X
for Y; this generalizes/reuses/deliberately diverges from that because Z." A design.md with no file:line
references is a sign the grounding step (Step 1 in SKILL.md) got skipped.>
```

Good section titles state a decision, not a topic: "A registry of record, not a routing layer,"
"Exposure authority is a classification table, not a field on the artifact" — each one tells the reader
what was decided and implies there was an alternative that got rejected. If you can't state _why_ the
alternative was rejected, you probably haven't grounded the decision in the actual code yet.

## tasks.md

```markdown
# Tasks: <Title Case Name>

## 1. <First logical group>

- [ ] 1.1 <Concrete, single-PR-sized task>
- [ ] 1.2 <...>

## 2. <Next group>

- [ ] 2.1 <...>

## N. Verification

- [ ] N.1 <Test for a specific failure mode this change must prevent — name the scenario, not just "add
      tests">
- [ ] N.2 <...>
- [ ] N.M Run ruff, mypy, pytest, and the documentation check.
```

Every verification-section task should be traceable to a specific requirement/scenario in the spec delta
below — if a scenario says "X fails closed when Y," there should be a task testing exactly that.

## specs/\<capability\>/spec.md

```markdown
# <Capability Title> Delta

## ADDED Requirements

### Requirement: <One sentence naming the guarantee>

<MUST/MUST NOT prose. Be specific enough that "does this code satisfy the requirement" has one answer.>

#### Scenario: <Name of the case being verified>

- GIVEN <a concrete starting condition>
- WHEN <the action>
- THEN <the observable outcome>
- AND <any additional observable outcome>
```

Use `## MODIFIED Requirements`, `## REMOVED Requirements`, or `## RENAMED Requirements` (with `FROM`/`TO`)
instead of `ADDED` when the change alters or retires something already in `openspec/specs/`. A `REMOVED`
section needs no scenario — just the requirement title being removed and, ideally, one sentence in the
change's `proposal.md`/`design.md` saying why (superseded by what, or abandoned because of what).

**Worked example** (`add-hypothesis-trial-registration`):

> ### Requirement: Every candidate is registered before it can influence research
>
> The platform MUST register an immutable `TrialRegistration` before it selects prior art, invokes a
> provider, compiles a card, or requests replay. [...]
>
> #### Scenario: Unregistered candidate is refused
>
> - GIVEN a caller requests provider drafting, compilation, or replay for a candidate without a verified
>   trial registration
> - WHEN the consumer validates its inputs
> - THEN it refuses before reading candidate or evidence payloads
> - AND it records the missing registration as the refusal reason

Notice the scenario tests a _refusal path_, not just the happy path — most requirements in this repo's
specs pair a positive capability with at least one adjacent failure-mode scenario (missing input,
malformed input, an attempt to bypass the check). When drafting a new requirement, ask what the analogous
refusal scenario is before moving on.
