# Add Repository Evolution Markers

## Why

The roadmap currently contains only completed milestones and has no documented dependency convention
(`plans/roadmap.md:7-17`). The spec workflow describes four change artifacts but does not give contributors a
stable place or format for declaring predecessor changes (`plans/spec-driven-workflow.md:7-23`). This makes
it difficult to demonstrate why a change is ready or which change must land first.

The only implementation is the deliberately generic `hello` example (`packages/hello/src/index.ts:1-13`),
but the code itself does not tell someone cloning or forking the repository what should be replaced. A
standard marker, documented in the repository map, can preserve the teaching example while making its
replacement boundary visible to both humans and agents.

## What Changes

- Establish a prioritized roadmap milestone for repository evolution markers and dependency patterns.
- Document roadmap dependency ordering, statuses, and OpenSpec dependency/readiness conventions.
- Add a documented replacement marker to the current example implementation and its test fixture.
- Add verification that the marker convention and dependency documentation remain present and that the
  roadmap points to the governing change.

## Non-Goals

- No new application, provider integration, external service, or network-dependent example.
- No automatic migration or deletion of the `hello` example when a repository is cloned or forked.
- No dependency resolver, graph database, or new OpenSpec CLI behavior.
- No change to the `greet` function contract or existing Nx targets.

## Dependencies

None. This is the first roadmap change and establishes the dependency convention used by later changes.
