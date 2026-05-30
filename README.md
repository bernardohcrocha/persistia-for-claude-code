```
 ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
██║     ██║     ███████║██║   ██║██║  ██║█████╗
██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝
╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
 ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝

 ██████╗ ██████╗ ██████╗ ███████╗     ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝    ██╔═══██╗██╔════╝
██║     ██║   ██║██║  ██║█████╗      ██║   ██║███████╗
██║     ██║   ██║██║  ██║██╔══╝      ██║   ██║╚════██║
╚██████╗╚██████╔╝██████╔╝███████╗    ╚██████╔╝███████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚══════╝
```

**Your company's operating layer for Claude Code.**  
Local files. No server. No lock-in. Works with the tools you already use.

```
"Help me implement the Claude Code OS for my company."
```

Say that in Claude Code after dropping `FRAMEWORK.html` in your project. The agent builds everything else.

---

## Why this exists

I spent time testing Hermes Agent, Agent Zero, and similar frameworks looking for something that would let me run an intelligent agent on top of my own company's knowledge and workflows.

They're all impressive — but they solve a different problem. They're agent infrastructure. You still need to connect your data, define your processes, and figure out how to make the agent useful for your specific business.

What I actually needed was simpler:

- An agent that **knows my company** without me repeating context every session
- That **acts on my instructions** — send emails, query databases, generate reports — not just answers questions
- That **updates itself** as I give it new instructions or drop new documents
- That runs inside **Claude Code**, which I already use daily
- With **zero new infrastructure** — no server, no SaaS, no Docker

Claude Code OS is that layer. It's not an agent framework. It's the operating layer that makes Claude Code act like a co-pilot that actually knows your business.

---

## What it is

A single HTML file (`FRAMEWORK.html`) that:

1. **Documents the complete system** — folder structure, file formats, update protocols, AI instructions
2. **Bootstraps itself** — when you say the trigger phrase, the agent reads the file and builds your entire company brain from scratch
3. **Evolves with you** — skills update from your instructions, metrics update from your tools, documents process automatically when dropped in `inbox/`

The brain lives as files in your project. HTML for visual files (with timestamps showing freshness), Markdown for skills and knowledge. No database, no API, no account.

---

## What it is NOT

| This | Not this |
|---|---|
| A knowledge layer for Claude Code | A standalone agent framework |
| File-based, lives in your project | A SaaS product or cloud service |
| Runs where Claude Code runs | Requires its own server or runtime |
| Evolves from natural language instructions | Requires config files or code changes |
| Works with tools you already have | Requires new infrastructure |

---

## Install

**Option 1 — Direct (recommended)**

Open Claude Code in your project and say:

```
Fetch https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/FRAMEWORK.html, 
save it to my project root, and implement it.
```

Claude Code fetches the file, reads the protocol, and starts the setup interview automatically.

**Option 2 — Manual**

```bash
curl -O https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/FRAMEWORK.html
```

Then open Claude Code and say:

```
Help me implement the Claude Code OS for my company.
```

---

## What happens during setup

The agent runs a 9-step Bootstrap Protocol:

1. **Checks context** — fresh setup or expanding existing brain?
2. **Knowledge Drop** — creates `_brain/inbox/`, asks you to drop any existing documents (SOPs, brand guide, price tables, contracts). Reads everything, organizes it, archives the originals.
3. **Smart interview** — asks only what it couldn't find in your documents. One question at a time.
4. **Gap questions** — proactively identifies missing information: *"Your price table doesn't have rate limits per plan — what are they?"*
5. **Adapts the structure** — proposes which folders to create based on your teams and tools. Shows the plan, waits for approval.
6. **Builds the brain** — creates all files with real content from what was collected.
7. **Sets up CLAUDE.md** — wires the protocol so the agent reads the brain automatically in every future session.
8. **Connects tools** — sets up cron jobs for Stripe, Supabase, or any database to auto-update your metrics daily.
9. **Builds the dashboard** — a visual HTML dashboard that shows your north star metrics. Auto-refreshes in the browser.

Total time: 10–20 minutes. After that, the brain runs itself.

---

## What you get

**Ask anything:**
- *"How's my MRR this month vs last month?"*
- *"Which accounts are at risk right now?"*
- *"What's the most common support issue this week?"*
- *"What features are customers requesting most?"*

**Give orders:**
- *"Follow up with users who haven't made a second query after 7 days"*
- *"Send a welcome email to the 3 companies that signed up today"*
- *"Generate a weekly report of at-risk accounts with suggested next actions"*
- *"Every Monday morning, send me a summary of new signups from the past week"*

**Teach it:**
- *"From now on, when writing outreach emails always sign as Lucas, account manager"*
- *"Whenever someone from an accounting firm signs up, always mention LGPD compliance"*
- *"Never group emails by domain — send one per person"*

Instructions like these are automatically saved as skills in `_brain/skills/`. The agent applies them in every future session without you repeating.

---

## How it stays updated

```
Stripe / Supabase / Database
         ↓ cron (daily)
  _brain/metrics.html    ← live MRR, customers, usage
  _brain/dashboard.html  ← visual dashboard, auto-refreshes

New documents → _brain/inbox/
         ↓ next session (or on demand)
  Brain files updated
  inbox/ archived to _brain/archive/YYYY-MM-DD/

Your instructions → skills update immediately
         ↓
  _brain/skills/[area].md
```

Every brain file has a visible timestamp: *"updated 3h ago · next update in 14h"*. Stale data is immediately visible.

---

## Structure

```
_brain/
├── index.html          ← master map — agent reads this first, every session
├── dashboard.html      ← live metrics dashboard
│
├── core/               ← company foundation (product, brand, ICP)
├── operations/         ← metrics, customers — auto-updated via cron
├── sales/              ← pipeline, playbook, overview
├── marketing/          ← campaigns, content strategy
├── development/        ← stack, roadmap
│
├── skills/             ← operational playbooks — evolve from your instructions
│   ├── outreach.md
│   ├── fraud-detection.md
│   └── [area].md
│
├── inbox/              ← drop new documents here anytime
├── archive/            ← processed inbox files, organized by date
└── logs/               ← every change logged automatically
```

---

## Philosophy

| Principle | What it means |
|---|---|
| **Local files** | Everything lives as files in your project — HTML, Markdown, no database. Version control it, move it, copy it, own it completely. |
| **Index-first** | The agent always reads `index.html` before any action. Never loads everything — only what's needed for the current task. |
| **Living brain** | Metrics auto-update from your tools. Documents process when dropped in inbox. Skills evolve from your instructions. |
| **Memory ≠ Skills** | Memory stores facts (what's true). Skills store instructions (how to operate). Different files, different purpose. |
| **Natural language** | You give orders like you'd give them to a smart employee. The agent manages files, crons, and databases. You don't touch any of it. |
| **No lock-in** | Everything is files in your project. Move it, copy it, version control it, delete it. Nothing depends on an external service. |

---

## Voice tip

Use [handy.computer](https://handy.computer) or WhisperFlow to talk to your company brain without typing. Give orders between meetings. Ask about revenue while commuting. The agent operates the same whether you type or dictate.

---

## License

MIT — free to use, fork, and adapt for any company.

---

*Built out of necessity after testing Hermes Agent, Agent Zero, and others. Needed something that runs local, follows my existing workflows, and doesn't require a separate infrastructure to maintain. This is that thing.*
