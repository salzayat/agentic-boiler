# repository-planning Specification

## Purpose

Define roadmap sequencing, OpenSpec dependency declarations, and the readiness evidence required before work
can begin.

## Requirements

### Requirement: Roadmap entries establish dependency order

The roadmap MUST list planned capabilities in execution order and link each capability to its governing
OpenSpec change. When a capability depends on another change, the predecessor MUST appear earlier in the
roadmap milestone or in an earlier milestone. A change is dependency-ready only when every listed predecessor
is archived and its required verification evidence is recorded.

#### Scenario: Later work waits for an unfinished predecessor

- GIVEN a roadmap milestone lists change A before change B
- AND change A has incomplete tasks or is not archived
- WHEN an agent selects the next change
- THEN it selects A rather than B
- AND B is not treated as dependency-ready

### Requirement: OpenSpec changes declare dependencies and readiness

An OpenSpec change that depends on another change MUST include a `## Dependencies` section in its proposal or
design. Each dependency MUST name the governing change and state the concrete readiness condition. A change
with no dependency MUST state `None` so that absence is intentional and reviewable.

#### Scenario: Reviewer can determine whether a change may start

- GIVEN a contributor reviews an OpenSpec proposal
- WHEN the contributor reads its Dependencies section
- THEN the contributor can identify predecessor changes and their readiness conditions
- AND cannot infer readiness solely from roadmap prose

### Requirement: Template code marks clone and fork replacement boundaries

The repository MUST use the literal `TEMPLATE:REPLACE` marker for tracked example code that is expected to be
replaced or substantially adapted after a clone or fork. The marker MUST identify the replacement boundary
without changing runtime behavior, and its documentation MUST explain when and how to act on it.

#### Scenario: Fork owner finds the example replacement boundary

- GIVEN a contributor forks the repository to start a domain project
- WHEN the contributor searches tracked implementation and test files for `TEMPLATE:REPLACE`
- THEN the current example implementation and its test fixture identify themselves as replaceable
- AND the contributor can follow linked guidance without deleting the repository governance first
