# SchwarzWorker (szw-*)

A standalone, KPI- and responsibility-aware spec-driven development system for OpenCode. Describe what you want; the system plans, executes, and verifies in phases with clear definition of done.

## Installing

```bash
npx schwarz-worker
```

Prompts for global (`~/.config/opencode/`) or local (`./.opencode/`). Use `npx schwarz-worker --global` or `npx schwarz-worker --local` to skip the prompt. From the repo: `npx file:./schwarz-worker` or `node schwarz-worker/bin/install.js --local`. See [INSTALL.md](INSTALL.md).

## Quick Start

| Scenario     | First step     
                                      | Then                    |
|-------------|-------------------------------------------------------|-------------------------|
| **Greenfield** | `/szw-new-project`                                  | `/szw-phase 1`, 2, 3…   |
| **Brownfield** | `/szw-map-codebase` then `/szw-new-project`          | Same phase loop         |
| **Jira/sprint** | New project or milestone with ticket scope           | `/szw-phase N` per phase |

One phase in one go: `/szw-phase 1` runs plan → execute → verify for phase 1.

---

## How developers use it

### New app from scratch (greenfield)

You have an idea; no code yet.

1. Open the project folder in OpenCode.
2. Run **`/szw-new-project`**. Answer the questions (what you’re building, v1 scope, tech preferences). Approve the roadmap.
3. For each phase: **`/szw-phase 1`**, then **`/szw-phase 2`**, … You get plan → execute → verify in one command; do manual UAT when prompted.
4. When all phases are done: **`/szw-audit-milestone`**, then **`/szw-complete-milestone`**. Optionally **`/szw-new-milestone "v2"`** for the next version.

### Adding to an existing codebase (brownfield)

The repo already has code; you’re adding a feature or refactor.

1. In the repo: **`/szw-map-codebase`** so the system knows stack and structure.
2. **`/szw-new-project`** and describe what you’re adding. The roadmap is scoped to the existing codebase.
3. Same as greenfield: **`/szw-phase 1`**, **`/szw-phase 2`**, … then audit and complete.

### Sprint with Jira (or similar)

Work is already defined in tickets.

1. Start a milestone that matches the sprint: **`/szw-new-project`** (or **`/szw-new-milestone "Sprint 42"`**) and paste or summarize the ticket scope when asked.
2. Map one phase per ticket (or one phase per batch of small tickets). For each phase: **`/szw-phase N`**. Use the ticket text and acceptance criteria in discuss/verify.
3. Small fixes: **`/szw-quick`** — describe the ticket, get plan + execute without full verify-work.
4. End of sprint: **`/szw-audit-milestone`**, then **`/szw-complete-milestone`**.

### Quick fix or small task

No need for the full phase flow.

- Run **`/szw-quick`**, describe what you want (e.g. “Fix login validation on email field”). You get a plan and execution; no phase verification or UAT. Use for bugs, config tweaks, one-off changes.

### “Where am I?” and handoff

- **`/szw-progress`** — shows current milestone, phase status, and the suggested next command.
- Stopping mid-phase: **`/szw-pause-work`**. Later: **`/szw-resume-work`** to get context and the next step back.

---

## Commands (szw-*)

### Core workflow

| Command | Purpose |
|---------|---------|
| `/szw-new-project` | Initialize: questions → research → requirements → roadmap. |
| `/szw-map-codebase` | Analyze existing codebase (run before new-project on brownfield). |
| `/szw-discuss-phase N` | Capture implementation decisions for phase N. |
| `/szw-plan-phase N` | Research + plan + plan-check for phase N. |
| `/szw-execute-phase N` | Run plans; internal verification; atomic commits. |
| `/szw-verify-work N` | Manual UAT for phase N. |
| `/szw-phase N [--no-verify-work]` | Fused: plan → execute → verify for phase N. |
| `/szw-audit-milestone [version]` | Audit milestone against DOD and KPIs. |
| `/szw-complete-milestone` | Archive milestone, tag release. |
| `/szw-new-milestone [name]` | Start next milestone. |

### Navigation and utilities

| Command | Purpose |
|---------|---------|
| `/szw-progress` | Where am I? What’s next? KPI summary. |
| `/szw-help` | List szw- commands and doc links. |
| `/szw-quick` | Ad-hoc task (plan + execute, no verify-work). |
| `/szw-add-phase`, `/szw-insert-phase N`, `/szw-remove-phase N` | Phase management. |
| `/szw-pause-work`, `/szw-resume-work` | Handoff. |
| `/szw-debug [desc]` | Systematic debugging. |
| `/szw-settings` | Config: profiles, workflow toggles. |

---

## What it provides

- **Planning structure** — `.planning/` with PROJECT, REQUIREMENTS, ROADMAP, STATE, phases ([docs/PLANNING-STRUCTURE.md](docs/PLANNING-STRUCTURE.md)).
- **KPIs and DOD** — Metrics, targets, and quantified definition of done ([docs/KPIS-AND-TARGETS.md](docs/KPIS-AND-TARGETS.md), [docs/DEFINITION-OF-DONE.md](docs/DEFINITION-OF-DONE.md)).
- **Responsibility and ownership** — Per-role contracts and who owns outcome ([docs/RESPONSIBILITY-CONTRACTS.md](docs/RESPONSIBILITY-CONTRACTS.md), [docs/OWNERSHIP-MODEL.md](docs/OWNERSHIP-MODEL.md)).
- **Flow and files** — Which files each flow reads/writes ([docs/FLOW-AND-FILES.md](docs/FLOW-AND-FILES.md)).

## Repo layout

`commands/szw/`, `workflows/`, `agents/`, `references/`, `templates/`, `docs/`, `bin/`. See [docs/FLOW-AND-FILES.md](docs/FLOW-AND-FILES.md) for what each flow touches.

---

**Prerequisites:** [OpenCode](https://opencode.ai/) or a host that runs slash commands and spawns subagents from markdown.  
**Version:** 0.2.0 — Standalone; no GSD dependency.
