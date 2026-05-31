<div align="center">

![Claude Code OS](claude-code-os.png)

**Claude Code OS**

# The Operational Copilot that Self-Updates.

Self-evolving · No extra tools · No workflow changes · Token-efficient · Auto git backup

[![MIT License](https://img.shields.io/badge/License-MIT-da7756?style=flat-square)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-da7756?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai/code)

</div>

---

Claude Code executes well. The problem is it has no **operational memory**.

Every session starts from zero. Every new feature, every new document, every detail that changed in your project: you had to re-explain it, or dump the entire project as context and pay the token cost. Either way, you're doing work the agent should be doing.

**Claude Code OS fixes that.** A `_brain/` folder lives inside your project root. It reads from your code, docs, and configs on first run. From then on, it updates itself every day, automatically, based on what actually changed.

---

## It already knows.

You ship a new payment method. It updates the product knowledge, the customer segments it unlocks, and the metrics to start tracking. You never said a word.

You add brand assets to a folder. Brand guidelines updated automatically.

You come back after a month on a new machine. It reads the files and continues without skipping a beat. No re-explaining your stack. No copy-pasting context. Nothing lost.

---

## It acts. Not just remembers.

Ask questions no simple dashboard can answer. Or schedule tasks that run automatically, with full context already loaded.

→ *"Which customers dropped usage 30%+ this month? Cross-check their support history and draft a personalized re-engagement message for each."*

→ *"Every Monday: pull last week's numbers from Stripe, compare against the previous week, flag anomalies, and queue a follow-up for any account that dropped below 10% quota."*

→ *"Find signups from the last 30 days with no activity after signup. Filter out fake-looking domains. Visit each company's website, understand what they do, map it to how similar customers already use the product, and write a personalized email for each, leading with the pain points most relevant to their specific use case."*

Set once. Runs automatically. Already has full context because it lives in the project.

---

## Token-efficient by design.

Every day, `git diff HEAD~1` detects exactly what changed. 1,000 files in the project, 3 changed today: it reads 3. Not a full re-read. Just the delta.

One changed file updates every dimension it touches at once: product knowledge, customer segments, metrics, skills. Automatic. Lightweight.

---

## Every instruction becomes permanent.

Say it once: *"When flagging fraud, always cross-check disposable email domains, duplicate names, and signup timing."*

It writes `_brain/skills/fraud.md` immediately. Loaded at every future session start. Applied automatically, forever. No reminders. No editing files. No re-explaining.

---

## Pair it with speech-to-text.

Add [Wispr Flow](https://wisprflow.ai/) or [handy.computer](https://handy.computer) and it starts feeling like a real super employee you can give orders to from anywhere: desk, commute, walking between meetings.

*"Check if any Pro accounts are near quota and draft a heads-up for each."* Done. While you're making coffee.

---

## One command. It builds itself from there.

Open Claude Code in your **project root folder**, then run:

```bash
curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/setup.sh | bash
```

Claude scans your entire project, connects to your existing tools, and asks only what it can't find. No forms. No config files. Just a conversation.

> **Requires:** git · Node.js 18+

> **Optional:** [GitHub CLI](https://cli.github.com) (`gh`) — if installed and authenticated, setup automatically creates a private brain repository and enables cloud backup with every commit. Format your machine, `git clone` the brain repo, continue exactly where you left off.

> **Scheduler included:** installs automatically (launchd on macOS, systemd on Linux). Catches up on missed tasks after sleep or restart.

---

## Structure

```
_brain/
├── .git/             ← isolated brain repository, pushes to private GitHub remote
├── index.html        ← agent reads this first, every session
├── dashboard.html    ← live command center, auto-refreshes in browser
├── core/             ← product, brand, ICP
├── operations/       ← metrics + customers, auto-updated daily
├── skills/           ← permanent rules, created and updated automatically
└── tasks/            ← scheduled tasks queue, managed automatically
```

→ [How the git architecture works](ARCHITECTURE.md)

---

No subscriptions. 100% free. 100% open source.

Fork it. Adjust it. Make it yours.

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*

MIT License · 2026
