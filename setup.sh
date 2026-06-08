#!/usr/bin/env bash
# Persistia — Setup Script
# https://github.com/bernardohcrocha/persistia-for-claude-code
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/persistia-for-claude-code/main/setup.sh | bash

set -e

REPO="https://raw.githubusercontent.com/bernardohcrocha/persistia-for-claude-code/main"
PROJECT_DIR="$(pwd)"

echo ""
echo "  ╔════════════════════════════════════════════════╗"
echo "  ║              Persistia — Setup                ║"
echo "  ║  Self-updating persistent memory for Claude   ║"
echo "  ╚════════════════════════════════════════════════╝"
echo ""
echo "  Project: $PROJECT_DIR"
echo ""

# ── Requirements check ────────────────────────────────────────────────────────

if ! command -v node &>/dev/null; then
  echo "  ✗ Node.js not found. Install from https://nodejs.org (v18+)"
  exit 1
fi

NODE_VER=$(node -e "process.stdout.write(process.versions.node.split('.')[0])")
if [ "$NODE_VER" -lt 18 ]; then
  echo "  ✗ Node.js v18+ required. Found: v$(node --version)"
  exit 1
fi

if ! command -v git &>/dev/null; then
  echo "  ✗ Git not found. Install from https://git-scm.com"
  exit 1
fi

echo "  ✓ Node.js $(node --version)"
echo "  ✓ Git $(git --version | awk '{print $3}')"
echo ""

# ── Project git init (used for idle detection only) ───────────────────────────

if ! git rev-parse --git-dir &>/dev/null; then
  echo "  → Initializing project git..."
  git init -q
  # Use -c flags as fallback so setup works even without global git user config
  git -c user.email="setup@persistia.local" -c user.name="Persistia Setup" \
    commit --allow-empty -m "initial commit" -q
fi

# Brain has its own git — exclude it from project git
if [ -f ".gitignore" ]; then
  grep -qxF "_brain/" .gitignore || echo "_brain/" >> .gitignore
else
  echo "_brain/" > .gitignore
fi

# ── Create _brain/ structure ──────────────────────────────────────────────────

echo "  → Creating brain structure..."
mkdir -p \
  _brain/core \
  _brain/operations \
  _brain/skills \
  _brain/inbox \
  _brain/archive \
  _brain/tasks \
  _brain/scripts

# ── Download templates ────────────────────────────────────────────────────────

echo "  → Downloading templates..."

curl -fsSL "$REPO/templates/_brain/index.md"          -o _brain/index.md
curl -fsSL "$REPO/templates/_brain/dashboard.html"    -o _brain/dashboard.html
curl -fsSL "$REPO/templates/_brain/tasks/queue.json"  -o _brain/tasks/queue.json

# .gitkeep for empty dirs
touch _brain/skills/.gitkeep _brain/inbox/.gitkeep _brain/archive/.gitkeep

# ── Download scripts ──────────────────────────────────────────────────────────

echo "  → Downloading scripts..."

curl -fsSL "$REPO/scripts/queue-runner.mjs"     -o _brain/scripts/queue-runner.mjs
curl -fsSL "$REPO/scripts/git-commit-brain.sh"  -o _brain/scripts/git-commit-brain.sh
curl -fsSL "$REPO/scripts/setup-scheduler.sh"   -o _brain/scripts/setup-scheduler.sh
chmod +x _brain/scripts/git-commit-brain.sh _brain/scripts/setup-scheduler.sh

# ── CLAUDE.md ─────────────────────────────────────────────────────────────────

if [ -f "CLAUDE.md" ]; then
  echo "  → CLAUDE.md already exists — skipping (brain protocol already configured)"
else
  echo "  → Creating CLAUDE.md..."
  curl -fsSL "$REPO/templates/CLAUDE.md" -o CLAUDE.md
fi

# ── Scheduler ─────────────────────────────────────────────────────────────────

echo "  → Installing scheduler..."
bash _brain/scripts/setup-scheduler.sh 2>/dev/null || true

# ── Brain git + cloud backup ──────────────────────────────────────────────────

echo "  → Initializing brain repository..."
git -C _brain init -q
git -C _brain add .
git -C _brain -c user.email="setup@persistia.local" -c user.name="Persistia Setup" \
  commit -m "brain: persistia-for-claude-code initial setup" -q

BRAIN_REPO_NAME="$(basename "$PROJECT_DIR")-brain"
if command -v gh &>/dev/null && gh auth status &>/dev/null 2>&1; then
  echo "  → Creating private brain repository on GitHub..."
  if gh repo create "$BRAIN_REPO_NAME" --private --source=_brain --push -q 2>/dev/null; then
    GH_USER=$(gh api user --jq .login 2>/dev/null || echo "your-account")
    echo "  ✓ Brain backup active: github.com/$GH_USER/$BRAIN_REPO_NAME (private)"
  else
    echo "  ℹ Could not create brain repo — may already exist. Skipping."
  fi
else
  echo ""
  echo "  ──────────────────────────────────────"
  echo "  Cloud backup: install GitHub CLI to enable auto-push"
  echo "  → brew install gh && gh auth login"
  echo "  → cd _brain && gh repo create $BRAIN_REPO_NAME --private --source=. --push"
  echo "  ──────────────────────────────────────"
fi

# ── Commit project files ───────────────────────────────────────────────────────

echo "  → Committing project files..."
git add .gitignore CLAUDE.md 2>/dev/null || true
git commit -m "add: persistia-for-claude-code setup" -q 2>/dev/null || true

# ── Done ──────────────────────────────────────────────────────────────────────

echo ""
echo "  ╔════════════════════════════════════════════════╗"
echo "  ║             ✅  Setup complete!               ║"
echo "  ╚════════════════════════════════════════════════╝"
echo ""
echo "  Next step:"
echo ""
echo "  Open Claude Code in this folder."
echo "  Claude will scan your project and start your setup interview."
echo "  No forms. No config files. Just a conversation."
echo ""
echo "  ──────────────────────────────────────"
echo "  Scheduler:  every 15 min (catches up on wake)"
echo "  Git backup: auto-commits brain on every update"
echo "  Dashboard:  open _brain/dashboard.html in your browser"
echo "  ──────────────────────────────────────"
echo ""
