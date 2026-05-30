```
 ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
██║     ██║     ███████║██║   ██║██║  ██║█████╗
██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝
╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
 ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝

 ██████╗  ██████╗ ██████╗ ███████╗     ██████╗ ███████╗
██╔════╝ ██╔═══██╗██╔══██╗██╔════╝    ██╔═══██╗██╔════╝
██║      ██║   ██║██║  ██║█████╗      ██║   ██║███████╗
██║      ██║   ██║██║  ██║██╔══╝      ██║   ██║╚════██║
╚██████╗ ╚██████╔╝██████╔╝███████╗    ╚██████╔╝███████║
 ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚══════╝
```

### The Operational and Knowledge Co-Pilot for Solo Founders.
**Self-improving · Uses everything you already have · No server · No lock-in**

---

You already have a codebase, `.env` files with your API keys, scattered docs, brand assets, price tables. You just haven't had time to connect all of it into something useful.

**Claude Code OS reads everything you already have** — documents, code, configs, entire project folders — understands your business from the ground up, and turns Claude Code into your dedicated operational co-pilot. No reconnecting tools. No re-explaining context. No new infrastructure to maintain.

Pair it with a speech-to-text tool like [handy.computer](https://handy.computer) or WhisperFlow and you have your own dedicated virtual employee — assign tasks, ask anything, have it running your company based on everything you've already built.

---

## What it does

| | |
|---|---|
| **Uses everything you already have** | Reads your codebase, docs, and `.env` files. Your Stripe key is already there — no need to reconnect. Your product logic is in the code — no need to re-explain. Minimum effort to get started. |
| **Self-improving skills** | Every instruction becomes a permanent rule, applied forever — *"always sign emails as Lucas"*, *"flag accounting firms for LGPD"*. One instruction, done. Never repeat yourself. |
| **Proactive setup** | Reads your entire project, detects your tools, and **suggests use cases for your specific business** — you don't have to figure out what to ask for. |
| **Process documentation** | No SOPs written yet? It interviews you and **writes the documentation for you** — then keeps it updated automatically as things evolve. |
| **Live business metrics** | Connects to Stripe, Supabase, or any database already in your project. Revenue, customers, and usage **auto-update daily** — no manual exports, no dashboards to maintain. |
| **Operational orders** | Send emails, query databases, generate reports, schedule recurring tasks — all in **plain language**, no code required. |

---

## What you can do

**Ask anything about your business**
> *"How's my MRR this month vs last?"*  
> *"Which accounts are at risk right now?"*  
> *"Who signed up today — any look like fraud?"*  
> *"What are customers requesting most?"*

**Give operational orders**
> *"Follow up with users who haven't made a second query in 7 days"*  
> *"Send a welcome email to the companies that signed up today"*  
> *"Every Monday, send me a report of new signups and at-risk accounts"*

**Teach it your way of working**
> *"From now on, always mention LGPD when writing to accounting firms"*  
> *"Never group emails by domain — send one per person"*

These become **permanent skills** — applied automatically in every future session, without reminders.

---

## Install

Open Claude Code in your project and paste:

```
Help me implement Claude Code OS: https://github.com/bernardohcrocha/claude-code-os
```

The agent fetches the framework and **starts the setup interview automatically** — reading what you already have, asking only what's missing.

---

## Setup — once, 10–20 minutes

- **Point it at what you have** — drop documents, code, configs, brand assets into `_brain/inbox/`, or point it at existing folders. It reads everything, extracts what matters, archives the originals. Large codebases are processed in stages — architecture first, critical modules next, depth on demand.
- **Zero-friction connections** — your `.env` already has Stripe, Supabase, and other keys configured. It uses those directly, no reconnecting.
- **Proactive interview** — asks only what it couldn't find in your files. One question at a time, in plain language.
- **Suggests use cases** — based on what it found in your actual project, not generic templates.
- **Writes missing documentation** — *"I didn't find any SOPs — want me to document your onboarding process?"*
- **Builds a live dashboard** — your north star metrics, auto-refreshing in the browser.

After that, **the brain runs itself.**

---

## For small teams

The brain lives as files in your project. Commit `_brain/` to your git repository and every team member works from the same source of truth. Company knowledge, **version-controlled**.

---

## Structure

```
_brain/
├── index.html        ← agent reads this first, every session
├── dashboard.html    ← live metrics, auto-refreshes in browser
├── core/             ← product, brand, ICP
├── operations/       ← metrics + customers, auto-updated via cron
├── skills/           ← self-improving rules, evolve from every instruction
├── inbox/            ← drop any documents or files here anytime
└── archive/          ← processed files, kept for reference
```

---

## Philosophy

| | |
|---|---|
| **Single source of truth** | All company knowledge in one place — queryable, actionable, always up to date. |
| **Uses what you have** | Reads your existing project, code, and tools. Minimum effort to get started, minimum effort to keep going. |
| **Self-improving** | Skills evolve from your instructions. Every correction makes it permanently smarter. No retraining, no config — just talk. |
| **Proactive, not passive** | Reads your business, suggests actions, documents processes — doesn't wait to be asked. |
| **Local files** | No server, no database. Everything lives in your project — portable, versionable, fully owned. |

---

> **Tip:** Pair with [handy.computer](https://handy.computer) or WhisperFlow to talk to your company by voice — give orders between meetings, ask about revenue while commuting. Your virtual employee, always available.

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*  
MIT License · 2026
