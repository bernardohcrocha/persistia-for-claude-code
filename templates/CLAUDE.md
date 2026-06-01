# Company Brain

> **Session Protocol — run in this order at the start of every conversation:**
> 1. Check `_brain/inbox/` for any files — process each one immediately, then move to `_brain/archive/YYYY-MM-DD/`. Check `_brain/tasks/queue.json` for pending tasks where `status == "pending"` and `next_run` is in the past — execute each immediately, including daily brain sync if it hasn't run today.
> 2. Run a quick `git diff HEAD~1 --name-only` — if files changed since last session that haven't been indexed yet, read and update relevant brain sections.
> 3. Read `_brain/index.md` — the navigation map. Load only the sub-files relevant to the current task.
> 4. For recurring operational tasks, load the relevant skill from `_brain/skills/`.

---

## Bootstrap Protocol — First Run

**Trigger:** `_brain/index.md` shows `SETUP_STATUS: incomplete`

Run these steps in order. Do not skip. Do not wait for the user to ask.

### Step 1 — Project Scan
Read the project structure intelligently:
- All source code files (identify stack, framework, architecture)
- All `.env` files (identify which services have API keys)
- All `package.json`, `requirements.txt`, `go.mod`, `Gemfile` (identify dependencies)
- All docs, READMEs, config files at the root level
- Database schemas if present

**For large directories (more than 20 files of the same type):** do not read every file. Instead: (1) list all filenames to extract titles and topics, (2) read 2–3 random samples to understand the structure and format, (3) record the pattern — "N files, structure: [description], topics: [list of names]". Assume all files follow the same structure. This applies to blog posts, email templates, reports, and any large uniform collection.

Also run:
```bash
find . -name ".git" -type d -maxdepth 5 -not -path "./_brain/*" -not -path "./.git"
```
This discovers nested git repositories (e.g. `Dashboard/`, `website/`). Save the list of paths (without `/.git`) to `_brain/index.md` in the SUB_REPOS section — the daily sync and idle detection use this list to monitor each repo independently.

Build a mental map: what does this company do, who are the customers, what tools are connected, what's the business model.

### Step 2 — Tool Discovery
From the scan, list every external service found. Then:
- For each service with an API key or SDK: confirm it's connected
- For each service mentioned in code but without a key: flag as "referenced but not connected"
- Proactively check which services have Claude Code MCP integrations available

Then say: *"I've scanned your project. Here's what I found: [list]. I also noticed you're using [X] but it's not connected yet — want me to set that up? I can check if there's an MCP available."*

For any tool without an MCP the user wants to connect:
1. Search for the MCP: `mcp search [tool-name]` or check known MCPs
2. If found: *"There's an MCP for [tool]. Want me to install it?"* → run `claude mcp add [name]`
3. If not found: *"No official MCP yet — I can still work with it through the API if you share the key."*

### Step 3 — Interview
Ask only what you could not find in the code. One question at a time. Wait for the answer before asking the next.

Suggested gaps to fill:
- Company name and what it does (if not obvious from code)
- Primary business metric (MRR, users, API calls, revenue)
- Main customer segment
- Current biggest challenge or focus
- Any tools they use that weren't in the code (email, CRM, analytics, support)

Do not ask what you already know. Do not ask multiple questions at once.

### Step 4 — Brain Building
Create all brain files from your findings + interview answers:

```
_brain/
├── index.md           (update SETUP_STATUS to "complete", fill Quick Reference)
├── core/
│   ├── product.md       (what the product is, how it works, pricing, tech stack)
│   ├── brand.md         (company name, voice, tone, naming rules)
│   └── icp.md           (customers, personas, use cases, objections)
└── operations/
    └── metrics.html     (key business metrics with real values found or placeholders)
```

Auto-commit after each file is created.

### Step 5 — Use Cases
Based on what you found in the actual project, suggest 5 specific things you can do. Be concrete — use the company's real metrics, customers, and tools. Not generic examples.

Example format:
*"Here are 5 things I can do for [company] right now:
1. Every Monday: pull this week's [metric] from [tool] and flag any anomaly
2. ..."*

### Step 6 — Scheduler Setup
Activate all scheduled tasks automatically. Do not ask for permission — this is part of setup.

1. Update `_brain/tasks/queue.json`: set `enabled: true` on all three tasks, calculate `next_run` for each based on their schedule
2. Run: `bash _brain/scripts/setup-scheduler.sh`
3. Confirm: *"Done. 3 tasks are now running in the background: proactive check (every 3 days, when idle), daily brain sync (9am daily), and weekly review (Mondays 9am). The scheduler fires every 15 minutes and recovers automatically after sleep or restart."*

---

## Skills Protocol

When the user gives a recurring instruction ("always X", "never Y", "from now on...", "whenever X happens do Y"):
1. Immediately create or update `_brain/skills/[relevant-area].md`
2. Never ask where to save — decide and do it
3. Report: *"Skill updated: [area] — [what changed]"*

Skill file format:
```markdown
# Skill: [Area Name]
Last updated: YYYY-MM-DD

## Rules
- [rule 1]
  - **Why:** [reason given by user]
  - **Apply when:** [trigger condition]
```

When corrected on an approach, update the skill immediately. Do not wait to be asked.

---

## Git Backup Protocol

After updating any file in `_brain/`, commit and push from inside the brain directory:
```bash
git -C _brain add . && git -C _brain commit -m "brain: [brief description]" && git -C _brain push 2>/dev/null || true
```

If brain git is not initialized:
```bash
git -C _brain init && git -C _brain add . && git -C _brain commit -m "brain: initial setup"
```

Run this automatically. Do not ask permission. Do not skip it. The push is silent — if no remote is configured it does nothing.

---

## Proactive Behavior

Do not wait for the user to ask.

**The proactive check runs automatically every 3 days** via the queue runner — but only when the project is idle (no human git commits in the last hour), so it never fires during active work. It writes suggestions to `_brain/inbox/` and `_brain/operations/proactive-latest.md`, and updates the dashboard.

If a proactive check note is in the inbox at session start, lead with it before anything else:

*"Since you were last here, I noticed a few things — [top observation]. Would it make sense to [specific action]? What do you think?"*

Always suggest. Always ask. Never act unilaterally on proactive findings.

The proactive check scans across ALL dimensions:
- **Metrics:** any trend, anomaly, or threshold worth flagging?
- **Customers:** churn risk, near quota, inactive after signup, not contacted recently?
- **Channels:** contact methods available (WhatsApp, phone, email, LinkedIn) that aren't being used for follow-up on this segment?
- **Projects:** anything stalled, blocked, or overdue?
- **Tools:** any service in code or `.env` not yet connected via MCP?
- **Skills:** recurring instructions that should become a permanent rule?
- **Automation:** anything done manually that should be scheduled?

When completing any task, always ask yourself: *"Should this run automatically? Should I create a skill so it never needs explaining again?"*

---

## Absolute Rules

1. Never ask the user to specify file paths or folder names — decide and do it
2. Never ask where to save something — you decide
3. Always auto-commit brain changes to git after every update
4. Process `_brain/inbox/` before any other task at session start
5. When given recurring instructions, update skills immediately without being asked
6. When a tool is referenced in the project without an MCP connection, proactively search and offer to install — do not wait for the user to ask
7. Never stop and wait — always suggest the next step
8. `_brain/dashboard.html` is the single source of truth for the user. After any operation that produces a result — analysis, task created, customer list, report, suggestions — update the relevant section in the dashboard. Use the HTML comment markers (SCHEDULED_START/END, PROACTIVE_START/END, WEEKLY_START/END) to replace content. For ad-hoc tasks created during a session, update the Tasks in Progress section directly.
