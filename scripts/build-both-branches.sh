#!/bin/bash

set -e

CURRENT_BRANCH=$(git branch --show-current)
BRANCH1="${1:-main}"
BRANCH2="${2:-$CURRENT_BRANCH}"

rm -rf dist_branch1 dist_branch2

echo "Building $BRANCH1 branch..."

STASH_OUTPUT=$(git stash)
if [[ "$STASH_OUTPUT" != "No local changes to save" ]]; then
  STASHED=1
else
  STASHED=0
fi

git checkout "$BRANCH1"
yarn
yarn build
mv dist dist_branch1
echo "$BRANCH1" >dist_branch1/branchname.txt

echo "Building $BRANCH2 branch..."
git checkout "$BRANCH2"
yarn
yarn build
mv dist dist_branch2
echo "$BRANCH2" >dist_branch2/branchname.txt

echo "Build complete!"
echo "$BRANCH1 build: dist_branch1/index.js"
echo "$BRANCH2 build: dist_branch2/index.js"

if [[ $STASHED -eq 1 ]]; then
  git stash pop
fi
