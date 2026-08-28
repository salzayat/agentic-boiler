---
name: roadmap-execution
description: Use when the user says "proceed to next steps", invokes /next, or asks which OpenSpec change to execute next. Selects work from the roadmap and executes it from the active OpenSpec contract.
---

# Roadmap Execution

## Source Of Truth

`plans/roadmap.md` selects and orders implementation changes. The selected
change's `proposal.md`, `design.md`, `tasks.md`, and relevant `openspec/specs/` files define the work. Do
not copy requirements or task checklists into the roadmap.

## Selection

1. Run `./scripts/check-plan-freshness.sh` before trusting the milestone table.
2. Select the earliest milestone that is not complete.
3. Select its leftmost governing change that is not archived and has incomplete tasks.
4. Treat the listed governing changes as dependencies: do not execute a later change while an earlier one
   in that milestone remains unarchived. Partially completed later work remains recorded but does not make
   it dependency-ready.
5. If the check reports drift or the selection is ambiguous, resolve the roadmap documentation before
   beginning implementation.

## Execution

1. Read the selected change's `proposal.md`, `design.md`, `tasks.md`, and all relevant accepted specs.
2. Follow `AGENTS.md`: resolve behavioral ambiguity in OpenSpec before implementation, preserve immutable
   evidence and research boundaries, and make the smallest correct change.
3. Complete and verify the selected change according to its tasks and repository verification requirements.
4. Archive the change when every task is complete. Update the milestone only when every linked change is
   archived and its required immutable evidence is recorded.

## Boundaries

- `/next` selects and implements the dependency-ready change. It must read the selected contract before editing
  and update a task only when implementation and evidence support it.
- Do not infer implementation requirements from the roadmap alone.
- Do not bypass predecessor changes because a later change has partial tasks completed.
- Do not invoke a provider, run a replay, commit, push, or create a pull request without separate explicit user
  intent.
