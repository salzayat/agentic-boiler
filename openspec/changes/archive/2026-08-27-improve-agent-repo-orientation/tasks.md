# Tasks: Improve Agent Repository Orientation

## 1. Repository orientation

- [x] 1.1 Add a detailed root map covering implementation, Nx configuration, governance, specifications,
      plans, automation, harness adapters, and ignored/generated paths.
- [x] 1.2 Explain the source-of-truth hierarchy and the agent implementation loop with executable commands.

## 2. Agent and MCP guidance

- [x] 2.1 Document canonical harness paths, discovery symlinks, restart behavior, and harness verification.
- [x] 2.2 Document the local Nx MCP configuration path, supported bounded capabilities, and explicit safety
      exclusions without adding credentials or remote servers.
- [x] 2.3 Link the orientation from README, agent guidance, and contributor guidance.
- [x] 2.4 Add the OpenCode configuration schema declaration without changing the enabled server.

## 3. Verification

- [x] 3.1 Validate that the orientation names the repository's actual directories and current `hello` project.
      Evidence: `npm exec nx show projects --json` returned `hello`.
- [x] 3.2 Run `./scripts/check-harness.sh` and confirm all adapters remain symlinks to canonical content.
      Evidence: `Agent harness check passed`.
- [x] 3.3 Run `npm run check` and record the result after implementation.
      Evidence: passed strict OpenSpec, archive, roadmap, formatting, typecheck, lint, test, and build gates.
