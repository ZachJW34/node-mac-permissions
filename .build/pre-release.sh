#!/usr/bin/env bash
set -ex

npm whoami

patchVersion=$(npm --no-git-tag version patch)
nextVersion=${patchVersion}-next."$(date +%Y%m%d%H%M%S)"
echo "${nextVersion:1}"

npm version --no-git-tag -f "${nextVersion:1}"
npm run publish:next
