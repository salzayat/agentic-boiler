# workflow-governance Specification

## Purpose

TBD - created by archiving change add-executable-pr-and-dependency-governance. Update Purpose after archive.

## Requirements

### Requirement: PR automation preserves literal body content

The PR automation MUST support reading a pull-request body from an explicit file path and MUST pass its
contents literally, including Markdown backticks and OpenSpec change names. Inline body input and file body
input MUST be mutually exclusive. A missing or unreadable body file MUST fail before commit or push.

#### Scenario: Markdown body survives PR automation

- GIVEN a body file contains backticks, shell-looking text, and an OpenSpec change name
- WHEN the contributor runs the PR helper with that body file
- THEN the created pull request receives the exact file contents
- AND the helper does not execute or expand the body contents

### Requirement: Dependency declarations are executable

Repository checks MUST validate that every active OpenSpec change declares `## Dependencies` with either
`None` or exact existing change names. A dependency MUST be considered ready only when its governing change is
archived and its required tasks and verification evidence are complete.

#### Scenario: Unknown dependency fails closed

- GIVEN an active OpenSpec change names a nonexistent dependency
- WHEN the repository dependency check runs
- THEN it reports the exact missing dependency and fails

### Requirement: Roadmap order reflects dependency readiness

Roadmap checks MUST reject a dependent change listed before an unready predecessor and MUST require `Blocked`
status when a named predecessor is not ready. A milestone MAY be `Pending` or `In progress` only when its
predecessors are ready; `Complete` remains reserved for archived changes with recorded verification.

#### Scenario: Unready predecessor blocks later work

- GIVEN roadmap change B depends on unarchived change A
- AND B appears after A but is marked `Pending`
- WHEN the roadmap dependency check runs
- THEN it reports B as blocked or drifted
- AND it does not accept B as dependency-ready
