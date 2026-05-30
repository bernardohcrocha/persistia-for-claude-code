<div align="center">

![Claude Code OS](claude-code-os.png)

**Claude Code OS**

# The Operational Co-Pilot for Solo Founders

Self-improving · No new tools · No remote server · No lock-in

[![MIT License](https://img.shields.io/badge/License-MIT-da7756?style=flat-square)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-da7756?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai/code)

</div>

---

## Why Claude Code OS?

After testing OpenClaw, Hermes Agent, and Agent Zero (all solid, all worth exploring), I kept hitting the same wall. Powerful tools, but they require setting up infrastructure, defining use cases from scratch, and keeping data synced to a VPS. Overkill for someone running a company solo.

I needed something that runs **locally**: direct access to all my API keys and the latest version of my code, always in sync, no uploading or downloading back and forth, and **no security concerns about sharing environment variables.**

The goal: get **as close as possible to having a real super employee.** Pair it with **speech-to-text** to give voice orders while commuting, ask questions between meetings, and let it run and learn on autopilot. ([handy.computer](https://handy.computer) and [Wispr Flow](https://wisprflow.ai/) work great for this.)

**Minimum input, maximum output.**

### Core Philosophy

| Principle | What it means |
|---|---|
| **Reads first, asks second** | Drops into your project and reads your code, docs, and `.env` files. No explaining your stack. No reconnecting your tools. |
| **Asks the right questions** | Identifies what's missing and asks only that. One question at a time. It guides you. You don't chase it. |
| **Works with any starting point** | No SOPs? No documentation? Big mess of files? No problem. It interviews you and builds the structure for you. |
| **Improves itself automatically** | Every instruction updates **persistent memory** and creates or updates **skills** on the fly. The more you use it, the smarter it gets. No extra steps required. |

---

## Quick Start

Open Claude Code in your project and paste:

```
Help me implement Claude Code OS: https://github.com/bernardohcrocha/claude-code-os
```

The agent fetches the framework and starts the setup interview automatically.

---

## Example Use Cases

**Ask questions you CAN'T answer with a quick dashboard check**

- *"Which customers with above-average ticket size dropped usage by more than 30% this month? What's the likely reason?"*

- *"Cross-reference last week's support tickets with plan tier. List any Pro customers with recurring issues and suggest whether to escalate or issue a credit."*

- *"Of the signups from the last 30 days who haven't made a single API call yet, which ones look like real companies worth following up on?"*

**Give operational orders**

- *"Find customers with 6+ months of tenure and 500+ monthly calls. Draft a personalized message for each asking about their other integration needs."*

- *"Every Monday, compare new signups vs churned accounts from the previous week. Send me a summary with a suggested action for each segment."*

- *"Whenever a Pro account is below 10% of their monthly quota by the 20th, notify me and queue a check-in email for that customer."*

**Teach it your way of working**

- *"When flagging fraud in new signups, always cross-check: disposable email domain, multiple accounts with the same name, and signup time."*

- *"Whenever a customer upgrades, add them to a 30-day success sequence: first message at day 3, follow-up at day 14."*

- *"Group any churn risk report by company size: under 50 employees gets a personal email, over 50 gets flagged for me to handle directly."*

These become **permanent skills**, created and updated automatically, applied in every future session without reminders.

---

## What it does

| | |
|---|---|
| **Uses everything you already have** | Reads your codebase, docs, and `.env` files. Your Stripe key is already there. Your product logic is in the code. Minimum effort to get started. |
| **Self-improving skills** | Every instruction becomes a permanent rule. Created and updated on the fly, applied forever. One correction, done. |
| **Proactive setup** | Reads your entire project, detects your tools, and suggests use cases specific to your business. |
| **Process documentation** | No SOPs yet? It interviews you and writes them for you, then keeps them updated as things change. |
| **Live business metrics** | Connects to Stripe, Supabase, or any database already in your project. Auto-updates daily. |
| **Operational orders** | Send emails, query databases, generate reports, schedule tasks in plain language. No code. |

---

## Setup: low effort. It guides you.

Just drop what you have. The agent reads everything, asks only what's missing, and handles the rest.

- **Drop your files** into `_brain/inbox/`: docs, code, configs, anything. Reads everything, extracts what matters, archives the originals. Large codebases processed in stages.
- **Zero-friction connections**: your `.env` already has Stripe, Supabase, and other keys. Used directly.
- **One question at a time**: no forms, no checklists. Just a conversation.
- **Suggests use cases** based on what it found in your actual project.
- **Writes missing documentation**: *"No SOPs found. Want me to document your onboarding process?"*
- **Builds a live dashboard**: metrics auto-refreshing in your browser.

After that, **the brain runs itself.**

---

## Structure

```
_brain/
├── index.html        ← agent reads this first, every session
├── dashboard.html    ← live metrics, auto-refreshes in browser
├── core/             ← product, brand, ICP
├── operations/       ← metrics + customers, auto-updated via cron
├── skills/           ← self-improving rules, created and updated automatically
├── inbox/            ← drop any files here anytime
└── archive/          ← processed files, kept for reference
```

---

## Philosophy

| | |
|---|---|
| **Single source of truth** | All company knowledge in one place: queryable, actionable, always up to date. |
| **Minimum input, maximum output** | Reads your existing project and tools. You give instructions in plain language. It handles the rest. |
| **Self-improving** | Skills evolve from your instructions. Every correction makes it permanently smarter. |
| **Proactive** | Reads your business, suggests actions, documents processes. Doesn't wait to be asked. |
| **Local files** | No remote server, no database. Lives in your project: portable, versionable, fully owned. |

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*

MIT License · 2026
