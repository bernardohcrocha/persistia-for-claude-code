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

After testing OpenClaw, Hermes Agent, and Agent Zero — all solid, all worth exploring — I kept hitting the same wall. They're built for engineers who want to configure agent infrastructure. You define the use cases, spin up the server, keep your data synced between your machine and a VPS. Powerful, but overkill for someone running a company solo.

I needed something that runs inside Claude Code (already open every day), knows my business without starting from scratch each session, and gets smarter from the instructions I give naturally. No extra tools. No remote server. No setup tax.

The real goal was to get as close as possible to having a real super employee — someone who knows everything about the company, learns from every interaction, and is always available. Pairing it with speech-to-text like [handy.computer](https://handy.computer) or WhisperFlow makes that real: give orders while commuting, ask questions between meetings, let it run and learn on autopilot.

**The result:** minimum input, maximum output.

| | |
|---|---|
| **Reads first, asks second** | Drops into your project and reads your code, docs, and `.env` files. No explaining your stack. No reconnecting your tools. |
| **Asks the right questions** | Identifies what's missing and asks only that. One question at a time. It guides you — you don't chase it. |
| **Works with any starting point** | No SOPs? No documentation? Big mess of files? No problem. It interviews you and builds the structure for you. |
| **Improves itself automatically** | Every instruction creates or updates a skill on the fly. The more you use it, the smarter it gets — without any extra steps. |

---

## Quick Start

Open Claude Code in your project and paste:

```
Help me implement Claude Code OS: https://github.com/bernardohcrocha/claude-code-os
```

The agent fetches the framework and starts the setup interview automatically.

---

## Example Use Cases

**Ask questions you can't answer with a quick dashboard check**
> *"Which customers are showing early signs of churn based on their usage pattern this month?"*  
> *"Compare my CAC this quarter vs last — is cold email converting better than Google Ads?"*  
> *"Analyze today's signups and tell me which ones are worth prioritizing for outreach and why"*  
> *"Draft a win-back sequence for customers who downgraded in the last 60 days, using their specific plan history"*

**Give operational orders**
> *"Follow up with users who haven't made a second query in 7 days"*  
> *"Every Monday, send me a report of new signups and at-risk accounts"*  
> *"Set up a daily digest of support patterns and flag anything recurring"*

**Teach it your way of working**
> *"From now on, always mention LGPD when writing to accounting firms"*  
> *"Never group emails by domain — send one per person"*

These become **permanent skills** — created and updated automatically, applied in every future session without reminders.

---

## What it does

| | |
|---|---|
| **Uses everything you already have** | Reads your codebase, docs, and `.env` files. Your Stripe key is already there. Your product logic is in the code. Minimum effort to get started. |
| **Self-improving skills** | Every instruction becomes a permanent rule. Created and updated on the fly, applied forever. One correction, done. |
| **Proactive setup** | Reads your entire project, detects your tools, and suggests use cases specific to your business. |
| **Process documentation** | No SOPs yet? It interviews you and writes them for you — then keeps them updated as things change. |
| **Live business metrics** | Connects to Stripe, Supabase, or any database already in your project. Auto-updates daily. |
| **Operational orders** | Send emails, query databases, generate reports, schedule tasks — in plain language, no code. |

---

## Setup — low effort. It guides you.

Just drop what you have. The agent reads everything, asks only what's missing, and handles the rest.

- **Drop your files** into `_brain/inbox/` — docs, code, configs, anything. Reads everything, extracts what matters, archives the originals. Large codebases processed in stages.
- **Zero-friction connections** — your `.env` already has Stripe, Supabase, and other keys. Used directly.
- **One question at a time** — no forms, no checklists. Just a conversation.
- **Suggests use cases** based on what it found in your actual project.
- **Writes missing documentation** — *"No SOPs found — want me to document your onboarding process?"*
- **Builds a live dashboard** — metrics auto-refreshing in your browser.

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
| **Single source of truth** | All company knowledge in one place — queryable, actionable, always up to date. |
| **Minimum input, maximum output** | Reads your existing project and tools. You give instructions in plain language. It handles the rest. |
| **Self-improving** | Skills evolve from your instructions. Every correction makes it permanently smarter. |
| **Proactive** | Reads your business, suggests actions, documents processes — doesn't wait to be asked. |
| **Local files** | No remote server, no database. Lives in your project — portable, versionable, fully owned. |

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*  
MIT License · 2026
