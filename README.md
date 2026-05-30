<div align="center">

![Claude Code OS](claude-code-os.png)

**Claude Code OS**

# The Operational Copilot for Solo Founders.

Fully local · No extra tools · No workflow changes · Self-evolving · Auto git backup

[![MIT License](https://img.shields.io/badge/License-MIT-da7756?style=flat-square)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-da7756?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai/code)

</div>

---

You're running a real company solo. You already have Stripe, Supabase, code, docs, customers — all sitting in your project folder.

**Claude Code OS turns all of that into an operational co-pilot that knows your whole business, executes tasks on command, and proactively suggests what to do next.**

**No extra subscriptions.** Replaces Trello for task tracking, Notion for documentation, and a lightweight CRM for customer management — all in **static files** your AI reads, updates, and acts on **automatically**, **backed up to git** on every update.

**No workflow changes.** It reads how you already work, learns your processes, and organizes around them. You don't adapt to it — **it adapts to you.**

**Fully local.** Your API keys stay on your machine. No infrastructure to set up. No remote server. No data leaving your environment. Just open your project, paste one command, and let it ask you what it needs.

Pair it with **speech-to-text** to give voice orders as you would to a real **super employee** — ask questions, delegate tasks, and let it run on autopilot ([handy.computer](https://handy.computer) and [Wispr Flow](https://wisprflow.ai/) work great for this).

---

## One command. It builds itself from there.

Open Claude Code in your **project root folder** (so it has access to all subfolders — development, marketing, docs, everything), then run this in the terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/setup.sh | bash
```

Claude picks up immediately after setup — scans your entire project, connects to your existing tools, discovers what's missing, and starts the interview. One question at a time.

No forms. No config files. Just a conversation.

> **Requires:** git · Node.js 18+

> **Scheduler included:** queue runner installs automatically and catches up on tasks even after sleep or restart.

---

## Ask. Give it operational tasks. Teach.

**Ask questions your dashboard can't answer**

- *"Which customers with above-average ticket size dropped usage by more than 30% this month? What's the likely reason?"*

- *"Cross-reference last week's support tickets with plan tier. List any Pro customers with recurring issues and suggest whether to escalate or issue a credit."*

- *"Of the signups from the last 30 days who haven't made a single API call yet, which ones look like real companies worth following up on?"*

**Give it operational tasks**

- *"Find customers with 6+ months of tenure and 500+ monthly calls. Draft a personalized message for each asking about their integration needs."*

- *"Every Monday, compare new signups vs churned accounts from the previous week. Send me a summary with a suggested action for each segment."*

- *"Whenever a Pro account is below 10% of their monthly quota by the 20th, notify me and queue a check-in message for that customer."*

- *"Every Monday at 9am: pull last week's numbers, flag any anomaly, and send me a summary with a suggested action for each segment."*

Set once. Runs automatically on schedule.

**Teach it how you work**

- *"When flagging fraud in new signups, always cross-check: disposable email domain, multiple accounts with the same name, and signup time."*

- *"Whenever a customer upgrades, add them to a 30-day success sequence: first message at day 3, follow-up at day 14."*

- *"Group any churn risk report by company size: under 50 employees gets a personal email, over 50 gets flagged for me to handle directly."*

These become **permanent skills**: created automatically, updated on the fly, applied in every future session without reminders.

---

## What you get

| | |
|---|---|
| **Your existing tools, already connected** | Reads your codebase, docs, and `.env` files. Your Stripe key is already there. Your product logic is in the code. Zero extra setup. |
| **Self-improving skills** | Every instruction becomes a permanent rule. Created and updated on the fly, applied forever. One correction, done. |
| **Live business metrics** | Connects to Stripe, Supabase, or any database already in your project. Builds a live dashboard. Auto-updates daily. |
| **Proactive setup** | Reads your entire project, detects your stack, and suggests use cases specific to your business. Doesn't wait to be asked. |
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

No re-explaining your stack. No onboarding again. **Nothing lost.**

---

## Your live command center

Metrics, active projects, customers to watch, tasks in progress — everything in one auto-refreshing page.

Built from your actual data on day one, 100% tailored to your business. No static boxes. No past-century dashboard grids. A dynamic interface that adapts to what you're currently working on.

Want to change anything? Give it a voice instruction. Done.

**Self-updating. Self-improving. Self-evolving.**

---

## Structure

```
_brain/
├── index.html        ← agent reads this first, every session
├── dashboard.html    ← live command center, auto-refreshes in browser
├── core/             ← product, brand, ICP
├── operations/       ← metrics + customers, auto-updated daily
├── skills/           ← self-improving rules, created and updated automatically
└── tasks/            ← scheduled tasks queue, managed automatically
```

---

## Why it works differently

| | |
|---|---|
| **Reads first, asks second** | Drops into your project and reads your code, docs, and `.env` files. No explaining your stack. No reconnecting your tools. |
| **Asks the right questions** | Identifies what's missing and asks only that. One question at a time. It guides you. You don't chase it. |
| **Works with any starting point** | No SOPs? No documentation? Big mess of files? No problem. It interviews you and builds the structure for you. |
| **Improves itself automatically** | Every instruction updates persistent memory and creates or updates skills on the fly. The more you use it, the smarter it gets. |
| **Fully local** | No remote server, no database. Lives in your project: portable, versionable, fully owned. Port to any tool at any time. |
| **Builds around you** | Not generic. Every brain, dashboard, and skill is shaped by your specific company, data, and instructions. |
| **Git as your safety net** | Every brain update is auto-committed. Permanent log. Push to GitHub for a cloud backup that stays in sync. Restore anything, anytime. |

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*

MIT License · 2026
