#!/bin/sh
set -eu

npm run format:check
npm run typecheck
npm run lint
npm run test
npm run build
