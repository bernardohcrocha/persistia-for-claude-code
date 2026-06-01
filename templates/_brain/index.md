# Company Brain — Index

<!-- SETUP_STATUS: incomplete -->

> **SETUP_STATUS: incomplete** — Run Bootstrap Protocol before anything else. Scan the project, interview the founder, build the brain.

---

## Navigation Map

| File | Contents | Load when |
|---|---|---|
| `_brain/index.md` | Navigation map, absolute rules, quick reference | Every session — read first |
| `_brain/core/product.md` | Product, stack, pricing, API, integrations | Technical or product questions |
| `_brain/core/brand.md` | Voice, tone, naming rules, words to use/avoid | Any content, copy, or communication task |
| `_brain/core/icp.md` | Customer personas, use cases, objections, segments | Sales, marketing, or customer-facing tasks |
| `_brain/operations/metrics.html` | Key business metrics — auto-updated via cron | Business health questions, weekly review |
| `_brain/skills/*.md` | Self-improving operational rules per area | Load relevant skill before each operational task |
| `_brain/tasks/queue.json` | Scheduled tasks and their status | Session start — check for pending tasks |
| `_brain/inbox/` | Unprocessed files dropped by the user | Session start — process before anything else |

---

## Sub-Repositories

<!-- SUB_REPOS_START -->
No sub-repositories detected yet — Claude will populate this during setup scan.
<!-- SUB_REPOS_END -->

---

## Quick Reference

| Key | Value |
|---|---|
| Company | — not yet set — |
| Product | — not yet set — |
| Stack | — not yet set — |
| Primary metric | — not yet set — |
| Customer segment | — not yet set — |
| Connected tools | — not yet set — |

---

## Absolute Rules

| # | Rule |
|---|---|
| 1 | Never ask the user to specify file paths — decide and do it |
| 2 | Always auto-commit brain changes: `git -C _brain add . && git -C _brain commit -m "brain: [description]" && git -C _brain push 2>/dev/null \|\| true` |
| 3 | Process `_brain/inbox/` before any other task at session start |
| 4 | When given recurring instructions, update `_brain/skills/[area].md` immediately |
| 5 | Check `_brain/tasks/queue.json` for pending tasks at session start |
| 6 | When a tool is mentioned without an MCP, search and offer to install |
| 7 | Never stop and wait — always suggest the next step |
| 8 | `_brain/dashboard.html` is the single source of truth. After any result — analysis, task, report, suggestions — update the relevant section using the HTML comment markers |
