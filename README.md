<div align="center">

![Persistia](Persistia.png)

**Persistia**

# Self-updating persistent memory for Claude Code.

Give Claude Code the persistent memory it was missing and turn it into your operational co-pilot.

[![MIT License](https://img.shields.io/badge/License-MIT-da7756?style=flat-square)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-da7756?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai/code)

</div>

---

Claude Code has no operational memory. Every session starts from zero. You re-explain your stack, paste context, repeat yourself.

**Persistia fixes that.** On first run, it scans your entire project — code, docs, brand assets, financial models, marketing briefs, configs. Reads your `.env` files and uses credentials you already have. Stores everything in small, focused files with a navigation index. Then monitors changes via `git diff`: 1,000 files, 3 changed, it reads 3. Token-efficient by design.

**The result:** an agent that always knows your full project and stays up-to-date automatically — even as you ship new features, update your positioning, or revise your financial model.

**Minimum input. Maximum output.**

---

## Install

Open Claude Code in your **project root folder**, then run:

```bash
curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/persistia-for-claude-code/main/setup.sh | bash
```

Claude scans your project and asks only what it can't find. No forms. No config files. Just a conversation.

> **Requires:** git · Node.js 18+

> **Optional:** [GitHub CLI](https://cli.github.com) (`gh`) — automatically creates a private brain repository with cloud backup on every update. Format your machine, `git clone` the brain repo, continue exactly where you left off.

> **Scheduler included:** installs automatically (launchd on macOS, systemd on Linux).

---

## How it works

- **Initial indexing** — on first run, scans your entire project: code, docs, configs, and environment files. Asks only what it can't find on its own. Uses credentials you already have — no manual reconnection.
- **Self-updating memory** — runs `git diff` daily. Only what changed gets read. No unnecessary context loaded.
- **Permanent skills** — say it once → written to `_brain/skills/`, loaded at every future session
- **Autonomous tasks** — schedule any task in plain language, runs automatically with full context. Each task in `_brain/tasks/queue.json` supports `batch_size` (cap items per run — prevents timeouts on large lists) and `timeout_minutes` (default: 5). Easy to customize.
- **Proactive scan** — every 3 days when idle, it scans metrics, customers, and channels and flags what it notices. Always suggests, never acts unilaterally.
- **Live dashboard** — open `_brain/dashboard.html`, auto-refreshes every 5 min
- **Shareable memory** — its own private git repo. Format your machine, `git clone` the brain repo, continue exactly where you left off. Shareable with your team.

Unlike Hermes Agent, Agent Zero, or OpenClaw — context updates itself. No manual maintenance required.

Everything in `_brain/` is plain text — readable, editable, and version-controlled.

---

## Make Claude Code your operational co-pilot

A dashboard shows numbers. This answers questions and executes orders — cross-tools.

- **Ask** — revenue, churn, at-risk accounts, support patterns — across all your tools at once.
- **Give orders** — outreach, reports, follow-ups. Executed using credentials you already have.
- **Schedule** — any task, in plain language, runs automatically with full context.

→ *"Which customers dropped usage 30%+ this month? Cross-check their support history and draft a personalized re-engagement message for each."*

→ *"Every Monday: pull last week's numbers from Stripe, flag anomalies, and queue a follow-up for any account that dropped below quota."*

→ *"Find signups from the last 30 days with no activity. Visit each company's website and write a personalized email leading with the most relevant pain points."*

---

## Structure

```
_brain/
├── .git/             ← isolated brain repository, pushes to private GitHub remote
├── index.md          ← agent reads this first, every session
├── dashboard.html    ← live command center, auto-refreshes in browser
├── core/             ← product, brand, ICP
├── operations/       ← metrics + customers, auto-updated daily
├── skills/           ← permanent rules, created and updated automatically
└── tasks/            ← scheduled tasks queue, managed automatically
```

→ [How the git architecture works](ARCHITECTURE.md)

---

## Under the hood

Persistia has two engines.

**Engine 1 — every time you open Claude Code**

`CLAUDE.md` is a native Claude Code feature: Claude reads it automatically at the start of every session. Persistia fills that file with a session protocol that runs before Claude responds to anything:

1. Check `_brain/inbox/` for new files — process and archive them
2. Run `git diff HEAD~1 --name-only` — read only what changed since last session, update the brain
3. Read `_brain/index.md` (the navigation map) — load only the sub-files relevant to the current task
4. Load the relevant skill from `_brain/skills/` if the task has one

It doesn't matter what kind of file changed. A new pricing page, a revised ICP doc, an updated financial model, a rewritten onboarding email — Claude reads the diff, updates the brain, and carries that context forward. No manual re-explaining.

**Engine 2 — background, even when Claude is closed**

Setup installs a system scheduler (launchd on macOS, systemd on Linux) that fires `queue-runner.mjs` every 15 minutes. When a task is due, the runner calls `claude -p "<prompt>"` — Claude CLI in headless mode — which opens your project, reads `CLAUDE.md`, runs the task, writes to `_brain/`, and auto-commits. No window, no interaction required.

Three tasks run by default: daily brain sync at 9am, weekly review every Monday at 9am, and a proactive opportunity check every 3 days (only when the project is idle — no commits in the last hour, so it never fires while you're actively working).

If the `claude` CLI isn't found, the runner writes the task to `_brain/inbox/` instead — Engine 1 picks it up at your next session.

**Your day to day**

| Situation | What happens |
|---|---|
| You open Claude Code | Reads inbox + git diff + index.md, updates brain before responding |
| You ship a new feature or push code | Brain auto-indexes the change — stack, architecture, and integrations stay current |
| You update a doc, spreadsheet, or marketing brief | Same — brain picks it up via git diff, next session Claude already knows |
| You say "always do X" | Claude creates `_brain/skills/x.md` immediately, no questions |
| You say "every Monday do Y" | Becomes a task in `queue.json`, runs automatically via Engine 2 |
| Machine on, you're away | 15-min timer fires `claude -p`, brain updates on its own |
| You open a new session | Brain already reflects everything that changed |

All schedules are plain text in `_brain/tasks/queue.json`. To adjust any frequency, just ask — *"Run the proactive check weekly instead of every 3 days"* — Claude updates it on the spot.

---

No subscriptions. 100% free. 100% open source.

*Claude Code is a product of Anthropic. Persistia is an independent open-source project, not affiliated with or endorsed by Anthropic.*

MIT License · 2026
