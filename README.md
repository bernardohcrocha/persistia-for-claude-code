<div align="center">

![Claude Code OS](claude-code-os.png)

**Claude Code OS**

# The Operational Copilot that Self-Updates.

Self-evolving · No extra tools · No workflow changes · Token-efficient · Auto git backup

[![MIT License](https://img.shields.io/badge/License-MIT-da7756?style=flat-square)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-da7756?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai/code)

</div>

---

Like having a super employee who knows your entire business and is always up to date — without you ever giving context again, even as the codebase and docs change.

---

Claude Code executes well. The problem is it has no **operational memory**.

Every session starts from zero — you re-explain your stack, paste context, repeat yourself. Or dump the entire project and pay the token cost. Either way, you're doing work the agent should be doing.

**Claude Code OS fixes that.** A `_brain/` folder lives in your project root. First run: Claude reads everything. Every day after: `git diff HEAD~1` — 1,000 files, 3 changed today: it reads 3.

---

- **Self-updating memory** — reads git diff daily, updates only what changed
- **Permanent skills** — say it once → written to `_brain/skills/`, loaded forever
- **Scheduled tasks** — set once, runs automatically with full context
- **Live dashboard** — auto-refreshes every 5 min, no conversation needed
- **Cloud backup** — private git repo, pushed on every update

---

## Without it vs with it

| | Without Claude Code OS | With Claude Code OS |
|---|---|---|
| Starting a session | Re-explain stack, paste context | Full context loaded automatically |
| New feature shipped | Update agent manually or it reasons from stale info | Brain updates itself from the diff |
| Recurring task | Repeat every session | Set once, runs automatically forever |
| Instruction given | Forgotten next session | Written to `_brain/skills/`, applied always |
| Dashboard / status | Open a conversation and ask | Open `dashboard.html`, already updated |

---

## No more re-explaining. It reads what changed automatically.

You ship a new payment method — it updates what the product does, who it unlocks as a customer, and what metric to start tracking. You never said a word.

You add brand assets to a folder. Brand guidelines updated automatically.

You come back after a month on a new machine. It reads the files and picks up exactly where you left off.

---

## Teach it once. It never forgets.

Say *"always cross-check disposable email domains when flagging fraud"* → it writes `_brain/skills/fraud.md` immediately. Loaded at every future session. Applied automatically. Forever.

---

## Autonomous tasks, always with full context

Schedule any task in plain language. It runs automatically, already knowing your entire product, customers, and metrics.

**Examples:**

→ *"Which customers dropped usage 30%+ this month? Cross-check their support history and draft a personalized re-engagement message for each."*

→ *"Every Monday: pull last week's numbers from Stripe, compare against the previous week, flag anomalies, and queue a follow-up for any account that dropped below 10% quota."*

→ *"Find signups from the last 30 days with no activity. Filter out fake-looking domains. Visit each company's website, map it to how similar customers use the product, and write a personalized email for each — leading with the most relevant pain points."*

---

## Live dashboard — updated automatically in the background

Open `_brain/dashboard.html`. It auto-refreshes every 5 minutes with real metrics, scheduled tasks, and proactive suggestions — built from your actual data, not a fixed template.

*Every 3 days, when the project is idle, it scans across metrics, customers, and channels. Always suggests. Never acts unilaterally.*

---

## Why not Hermes Agent, Agent Zero, or OpenClaw?

All solid tools. But they share the same fundamental problem: context doesn't update itself. Every new feature, every changed document — you maintain it manually, or the agent reasons from stale information.

| | Claude Code OS | Hermes Agent | Agent Zero | OpenClaw | System prompt |
|---|:---:|:---:|:---:|:---:|:---:|
| Always-updated operational context | ✓ | ✗ | ✗ | ✗ | ✗ |
| Token-efficient updates (git diff only) | ✓ | ✗ | ✗ | ✗ | ✗ |
| Lives inside your project | ✓ | ✗ | ✗ | ✗ | ✗ |
| Scheduled autonomous tasks | ✓ | ✓ | ✓ | ✓ | ✗ |
| No new tools required | ✓ | ✗ | ✗ | ✗ | ✓ |
| Permanent skill files | ✓ | ✗ | ✗ | ✗ | ✗ |

---

## Pair it with speech-to-text.

Add [Wispr Flow](https://wisprflow.ai/) or [handy.computer](https://handy.computer). Give orders from anywhere — desk, commute, between meetings. It already knows the full context.

*"Check if any Pro accounts are near quota and draft a heads-up for each."* Done. While you're making coffee.

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

## One command. It builds itself from there.

Open Claude Code in your **project root folder**, then run:

```bash
curl -fsSL https://raw.githubusercontent.com/bernardohcrocha/claude-code-os/main/setup.sh | bash
```

Claude scans your project, connects to your existing tools, and asks only what it can't find. No forms. No config files. Just a conversation.

> **Requires:** git · Node.js 18+

> **Optional:** [GitHub CLI](https://cli.github.com) (`gh`) — setup automatically creates a private brain repository and enables cloud backup with every commit. Format your machine, `git clone` the brain repo, continue exactly where you left off.

> **Scheduler included:** installs automatically (launchd on macOS, systemd on Linux). Catches up on missed tasks after sleep or restart.

---

No subscriptions. 100% free. 100% open source.

Fork it. Adjust it. Make it yours.

---

*Claude Code is a product of Anthropic. Claude Code OS is an independent open-source project, not affiliated with or endorsed by Anthropic.*

MIT License · 2026
