#!/bin/sh
set -eu

npm exec openspec -- validate --all --strict
./scripts/check-harness.sh
./scripts/check-openspec-archive.sh
./scripts/check-plan-freshness.sh
./scripts/check-repository-conventions.sh
./scripts/check-docs.sh
./scripts/check-secrets.sh
npm run format:check
npm run typecheck
npm run lint
npm run test
npm run build
