#!/usr/bin/env bash
# Claude Code OS — Setup Script
# https://github.com/bernardohcrocha/claude-code-os
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/setup.sh | bash

set -e

REPO="https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main"
PROJECT_DIR="$(pwd)"

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║       Claude Code OS — Setup         ║"
echo "  ║  Operational Copilot for Solo Founders  ║"
echo "  ╚══════════════════════════════════════╝"
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

# ── Git init ──────────────────────────────────────────────────────────────────

if ! git rev-parse --git-dir &>/dev/null; then
  echo "  → Initializing git repository..."
  git init -q
  git commit --allow-empty -m "initial commit" -q
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

curl -fsSL "$REPO/templates/_brain/index.html"        -o _brain/index.html
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
bash _brain/scripts/setup-scheduler.sh 2>/dev/null

# ── Initial git commit ────────────────────────────────────────────────────────

echo "  → Committing brain to git..."
git add _brain/ CLAUDE.md 2>/dev/null || true
git commit -m "brain: claude-code-os initial setup" -q 2>/dev/null || true

# ── Done ──────────────────────────────────────────────────────────────────────

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║           ✅  Setup complete!         ║"
echo "  ╚══════════════════════════════════════╝"
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
echo "  Inbox:      drop any file in _brain/inbox/ anytime"
echo "  ──────────────────────────────────────"
echo ""
