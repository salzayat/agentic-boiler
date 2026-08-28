# Tasks: Fix Dependabot Documentation Gate

## 1. CI and documentation gate

- [x] 1.1 Pass an explicit Dependabot indicator from the CI workflow to the quality gate.
- [x] 1.2 Allow only Dependabot runs to skip the documentation-presence requirement when no docs are part of
      the dependency update.
- [x] 1.3 Document the exception and retain the normal local/human documentation gate.

## 2. Verification

- [x] 2.1 Strictly validate the OpenSpec change.
      Evidence: `npm exec openspec -- validate fix-dependabot-docs-gate --strict` passed.
- [x] 2.2 Test the documentation check for normal failure and the bounded Dependabot exception.
      Evidence: the Dependabot diff passed with `CHECK_DEPENDABOT=true` and failed without it.
- [x] 2.3 Run `npm run check` and record the result.
      Evidence: full local quality gate passed before archival.
