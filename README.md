<div align="center">

![Claude Code OS](claude-code-os.png)

**Claude Code OS**

# The Operational Copilot for Solo Founders.

Local-first · No extra tools · No workflow changes · Self-evolving · Auto git backup

[![MIT License](https://img.shields.io/badge/License-MIT-da7756?style=flat-square)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-da7756?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai/code)

</div>

---

You're running a real company solo. You already have Stripe, Supabase, code, docs, customers — all sitting in your project folder.

Claude Code already has the execution layer — it can run code, call APIs, write files, and schedule tasks autonomously. **The missing piece was a persistent operational brain:** something that knows your business, remembers your processes, and gets smarter without you having to repeat yourself.

**Claude Code OS is that layer.**

**No extra subscriptions.** Can replace Trello for task tracking, Notion for documentation, and a lightweight CRM for customer management — all in **static files** your AI reads, updates, and acts on **automatically**, **backed up to git** on every update.

**No workflow changes.** It reads how you already work, learns your processes, and organizes around them. You don't adapt to it — **it adapts to you.**

**Local-first.** Your API keys stay on your machine. No infrastructure to set up. No remote server. No data leaving your environment.

One more trick: pair it with **speech-to-text** ([Wispr Flow](https://wisprflow.ai/) or [handy.computer](https://handy.computer)) and it starts feeling like an actual **super employee** you can give orders to from anywhere — desk, commute, or walking between meetings.

---

## One command. It builds itself from there.

Open Claude Code in your **project root folder** (so it has access to all subfolders — development, marketing, docs, everything), then run this in the terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/setup.sh | bash
```

Claude picks up immediately — scans your entire project, connects to your existing tools, discovers what's missing, and starts the interview. One question at a time.

No forms. No config files. Just a conversation.

> **Requires:** git · Node.js 18+

> **Optional:** [GitHub CLI](https://cli.github.com) (`gh`) — if installed and authenticated, setup automatically creates a private brain repository and enables cloud backup with every commit.

> **Scheduler included:** queue runner installs automatically and catches up on tasks even after sleep or restart.

> **Recovery:** switched machines or wiped your computer? `git clone [brain-repo] _brain/` — open Claude Code and continue exactly where you left off. No setup, no interviews, no re-explaining.

---

## Ask. Give. Teach.

**Ask** — questions no dashboard can answer

*"Which customers dropped usage by 30%+ this month? What's the likely reason?"*

*"Any Pro customers with recurring support issues? Should I escalate or issue a credit?"*

*"Of signups in the last 30 days with zero API calls — which ones look like real companies worth following up?"*

---

**Give** — operational tasks, run on your schedule

*"Find customers with 6+ months of tenure. Draft a personalized message for each asking about their integration needs."*

*"Every Monday at 9am: pull last week's numbers, flag anomalies, send me a summary with a suggested action for each segment."*

*"Whenever a Pro account is below 10% quota by the 20th, queue a check-in message."*

Set once. Runs automatically.

---

**Teach** — how you work, so it never forgets

*"When flagging fraud: always cross-check disposable email domains, duplicate names, and signup timing."*

*"When a customer upgrades: add them to a 30-day sequence — message at day 3, follow-up at day 14."*

*"Churn risk reports: under 50 employees gets a personal email, over 50 gets flagged for me to handle directly."*

These become **permanent skills** — created automatically, applied in every future session. No reminders. No re-explaining.

---

## What you get

| | |
|---|---|
| **Your existing tools, already connected** | Reads your codebase, docs, and `.env` files. Your Stripe key is already there. Your product logic is in the code. Zero extra setup. |
| **Self-improving skills** | Every instruction becomes a permanent rule. Created and updated on the fly, applied forever. One correction, done. |
| **Live business metrics** | Connects to Stripe, Supabase, or any database already in your project. Builds a live dashboard — updated whenever your data changes or a scheduled task runs. |
| **Proactive suggestions** | Every 3 days, scans your customers, channels, and metrics — and leaves you a note with what it noticed. Never interrupts active work. Always asks before acting. |
| **Cloud backup** | Brain lives in its own private git repository, separate from your project. Every update commits and pushes automatically. Format your computer, clone the brain repo, continue where you left off. |
| **Process documentation** | No SOPs yet? It interviews you and writes them. Then keeps them updated as things change. |
| **Plain language operations** | Send emails, query databases, generate reports, schedule tasks. No code required. |

---

## How it works

**1. Opens your project and reads everything.** Code, docs, `.env` files, configs — the entire project root, automatically. Large codebases are processed in batches to make sure nothing is left behind.

**2. One conversation.** It asks only what it can't find. No forms, no checklists. One question at a time.

**3. Stays in sync automatically.** Every day, a `git diff` detects exactly what changed — new files, edited docs, code updates, anything added anywhere in your project folder. The brain updates accordingly. Missed a run because the computer was off? **Automatic recovery** runs it as soon as you're back.

Not a template you fill in. A system that builds around you.

---

## Every session picks up exactly where the last one left off.

All instructions, protocols, and company knowledge live in `CLAUDE.md` and `_brain/`. Restart your computer, come back after a month, switch machines — Claude reads the files and continues without skipping a beat.

No re-explaining your stack. No copy-pasting context. No sending files back and forth. **Nothing lost.**

---

## Your live command center

Metrics, active projects, customers to watch, tasks in progress, proactive suggestions — everything in one auto-refreshing page.

No cookie-cutter template. No fixed layout. The dashboard is built from your actual data and evolves as your business does — different sections, different metrics, different priorities. What's most relevant right now is what it shows.

Want to change anything? Give it a voice instruction. Done.

**Self-updating. Self-improving. Self-evolving.**

---

## Structure

```
_brain/
├── .git/             ← isolated brain repository — pushes to private GitHub remote
├── index.html        ← agent reads this first, every session
├── dashboard.html    ← live command center, auto-refreshes in browser
├── core/             ← product, brand, ICP
├── operations/       ← metrics + customers, auto-updated daily
├── skills/           ← self-improving rules, created and updated automatically
└── tasks/            ← scheduled tasks queue, managed automatically
```

→ [How the git architecture works](ARCHITECTURE.md)

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*

MIT License · 2026
