# Improve Agent Repository Orientation

## Why

The README currently gives only a compact directory table (`README.md:72-84`), while the agent harness and
MCP boundary are explained separately in `plans/agent-harness.md:1-40`. An agent or new contributor must
join those documents to understand which paths are source, governance, generated, or adapter content.

The project configuration enables only the local Nx MCP server (`opencode.json:1-9`), but does not identify
its intended capabilities or the boundary between MCP discovery and repository authority. A single linked
orientation document will make the structure, supported agent adapters, MCP setup, and loop workflow
reviewable and discoverable without granting additional access.

## What Changes

- Add a repository orientation document that maps root directories and explains source-of-truth ownership.
- Document the canonical agent harness, discovery symlinks, MCP configuration path, and bounded Nx MCP use.
- Link the orientation document from the README, `AGENTS.md`, and contributor guidance.
- Add the OpenCode config schema declaration while preserving the existing local Nx MCP server only.

## Non-Goals

- No new MCP server, provider integration, credential, remote URL, or arbitrary network capability.
- No change to application behavior, Nx project boundaries, or project targets.
- No copied commands, skills, or agent instructions in adapter directories.
- No replacement of accepted OpenSpec requirements with README, plan, or orientation prose.
