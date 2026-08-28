# Roadmap

This roadmap orders future capabilities and teaches the intended growth path. OpenSpec changes contain
detailed requirements and tasks; this file contains only sequencing, status, and links to the governing
contract.

## Milestone Tracking

| Phase                                   | Governing changes                             | Status   |
| --------------------------------------- | --------------------------------------------- | -------- |
| Repository evolution conventions        | `add-repository-evolution-markers`            | Complete |
| Executable PR and dependency governance | `add-executable-pr-and-dependency-governance` | Complete |
| Foundation                              |                                               | Complete |
| Agent harness and MCP governance        | `improve-agentic-boiler-governance`           | Complete |

The repository evolution milestone comes first because it establishes the conventions used to plan and
sequence every later capability. The executable PR and dependency governance milestone extends those
conventions with safe body-file handling and dependency readiness checks. The initial foundation is
represented by accepted specs and the runnable `hello` project. The governance milestone is complete because
its change is archived and its accepted requirements are present.

Roadmap changes are ordered left to right within a milestone and top to bottom across milestones. A later
change may be selected only after every earlier governing change is archived and verified. Use `Pending` for
work not started, `In progress` for an active change, `Blocked` when a named dependency is not ready, and
`Complete` only for archived changes with recorded verification. Every row points to a governing change; it
never duplicates that change's requirements or task checklist.
