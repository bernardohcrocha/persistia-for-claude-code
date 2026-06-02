#!/usr/bin/env bash
# Persistia — Auto Git Backup for Brain
# Commits and pushes all changes in _brain/ to its private remote.
# Usage: bash _brain/scripts/git-commit-brain.sh "optional message"

set -e

BRAIN_DIR="$(cd "$(dirname "$0")/.." && pwd)"  # _brain/scripts/../ = _brain/
MSG="${1:-auto-update}"

cd "$BRAIN_DIR"

# Init git if somehow missing
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  git init -q
  git add .
  git commit -m "brain: initial commit"
  echo "✅ Brain git initialized"
  exit 0
fi

# Check for changes
if git diff --quiet HEAD 2>/dev/null && git diff --cached --quiet 2>/dev/null; then
  if [ -z "$(git ls-files --others --exclude-standard)" ]; then
    exit 0  # Nothing to commit
  fi
fi

git add .
git commit -m "brain: $MSG — $(date '+%Y-%m-%d %H:%M')"
git push 2>/dev/null || true  # push if remote configured, silently skip if not
echo "✅ Brain committed and pushed"
