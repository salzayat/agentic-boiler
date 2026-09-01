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
| Template and example expansion          | `add-second-example-package`                  | Complete |

The repository evolution milestone comes first because it establishes the conventions used to plan and
sequence every later capability. The executable PR and dependency governance milestone extends those
conventions with safe body-file handling and dependency readiness checks. The initial foundation is
represented by accepted specs and the runnable `hello` project. The governance milestone is complete because
its change is archived and its accepted requirements are present.

The template and example expansion milestone turns the repository into a usable template for spec and
harness engineering, not just a description of one. `add-second-example-package` comes first because it
demonstrates Nx project boundaries and inter-package dependency sequencing in working code; a future
onboarding guide (fork/rename/first-change) and a GitHub template-repository configuration would reference
this second package as their worked example, so they are sequenced after it and are not yet proposed as
OpenSpec changes.

Roadmap changes are ordered left to right within a milestone and top to bottom across milestones. A later
change may be selected only after every earlier governing change is archived and verified. Use `Pending` for
work not started, `In progress` for an active change, `Blocked` when a named dependency is not ready, and
`Complete` only for archived changes with recorded verification. Every row points to a governing change; it
never duplicates that change's requirements or task checklist.
