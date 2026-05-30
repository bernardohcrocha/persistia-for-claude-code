# Architecture — Brain Git

## Why `_brain/` has its own git repository

When you run the setup, `_brain/` gets its own `.git/` — completely separate from your project's git.

**Your project git is unchanged.** `_brain/` is added to your `.gitignore` automatically, so it never appears in your project's `git status`, never pollutes your commit history, and never gets pushed to your project's remote — even if that remote is public.

**Each sub-repository stays isolated too.** If your project has nested repos (`Dashboard/`, `website/`) connected to Vercel or other CI/CD pipelines, the brain commits don't touch them. The queue runner monitors those repos for changes (via `git diff`) but never writes to them.

---

## How backup works

During setup, if the [GitHub CLI](https://cli.github.com) is installed and authenticated, a private repository named `[your-project]-brain` is created automatically and set as the brain's remote.

From that point, every brain update — daily sync, proactive check, weekly review, skill created, session notes — commits and pushes to that private repo:

```bash
git -C _brain add .
git -C _brain commit -m "brain: [description]"
git -C _brain push
```

If `gh` wasn't available at setup, you can connect a remote manually at any time:

```bash
gh repo create my-project-brain --private --source=_brain --push
# or with standard git:
cd _brain
git remote add origin https://github.com/your-username/my-project-brain.git
git push -u origin main
```

Once a remote is configured, all future commits push automatically. No further setup needed.

---

## Recovery

If you format your computer or move to a new machine:

```bash
# 1. Clone your project as usual
git clone https://github.com/you/my-project

# 2. Restore the brain
git clone https://github.com/you/my-project-brain _brain/

# 3. Open Claude Code in the project root
# Claude reads _brain/ and continues exactly where you left off
```

Everything is restored: skills, operations, metrics history, proactive notes, scheduled task state, dashboard. No interviews, no re-explaining, no setup.

---

## What gets backed up vs. what doesn't

| Backed up | Not backed up |
|---|---|
| `_brain/core/` — product, brand, ICP | `.env` files (never in `_brain/`) |
| `_brain/operations/` — metrics, customers | Project source code (separate repo) |
| `_brain/skills/` — all operational rules | Node modules, build artifacts |
| `_brain/tasks/` — queue state, weekly reports | |
| `_brain/dashboard.html` — live command center | |
| `_brain/inbox/` and `_brain/archive/` | |

The brain repo contains only knowledge and configuration — never credentials or secrets.
