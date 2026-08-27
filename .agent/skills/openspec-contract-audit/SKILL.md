---
name: openspec-contract-audit
description: Use when auditing an active OpenSpec change or running /spec-audit. Reviews contract completeness, accepted-spec consistency, code grounding, and research-boundary risks without editing files.
---

# OpenSpec Contract Audit

1. Read the full active change and relevant accepted specs before reviewing code.
2. Run strict OpenSpec validation, but treat it as structural validation only.
3. Trace each requirement and scenario to tasks, tests, fixture commands, or immutable evidence. Flag missing
   proof mappings rather than assuming a broad test command covers a requirement.
4. Confirm proposal/design claims against cited code. Flag unsupported claims and immutable-artifact
   incompatibilities.
5. Check authority, data access, lifecycle, safety, reproducibility, and external-side-effect boundaries.

Present findings first, ordered by severity with exact references. Do not edit files or change task status.
