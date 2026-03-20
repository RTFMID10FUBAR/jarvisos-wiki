#!/usr/bin/env bash
set -euo pipefail
REPO_URL="$1"
BRANCH="${2:-main}"

git init
git checkout -b "$BRANCH"
git add .
git commit -m "Initial JarvisOS wiki"
git remote add origin "$REPO_URL"
git push -u origin "$BRANCH"
