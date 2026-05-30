#!/usr/bin/env bash
# Claude Code OS — Auto Git Backup
# Run after any _brain/ update.
# Usage: bash scripts/git-commit-brain.sh "optional message"

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

MSG="${1:-auto-update}"

# Init git if needed
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  git init
  git add .
  git commit -m "brain: initial commit"
  echo "✅ Git initialized and brain committed"
  exit 0
fi

# Check for changes in _brain/
if git diff --quiet HEAD -- _brain/ 2>/dev/null && git diff --cached --quiet -- _brain/ 2>/dev/null; then
  # Check for untracked files in _brain/
  if [ -z "$(git ls-files --others --exclude-standard _brain/)" ]; then
    exit 0 # Nothing to commit
  fi
fi

git add _brain/
git commit -m "brain: $MSG — $(date '+%Y-%m-%d %H:%M')"
echo "✅ Brain committed to git"
