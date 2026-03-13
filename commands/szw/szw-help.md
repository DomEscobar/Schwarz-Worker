---
name: szw-help
description: List SchwarzWorker (szw-) commands and link to KPIs, DOD, responsibility contracts
---
<objective>
Show all szw- commands and where to find KPI targets, definition of done, responsibility contracts, and ownership model.
</objective>

<process>
Output the following in clear markdown (do not wrap in a code block).

---

## SchwarzWorker (szw-*) commands

### Core workflow
| Command | Purpose |
|---------|---------|
| `/szw-new-project` | Initialize project: questions → research → requirements → roadmap. |
| `/szw-map-codebase` | Analyze existing codebase (brownfield). |
| `/szw-discuss-phase N` | Capture implementation decisions for phase N. |
| `/szw-plan-phase N` | Research + plan + plan-check for phase N. |
| `/szw-execute-phase N` | Run plans, verify; atomic commits. |
| `/szw-reassess-phase N` | Reassess downstream plan validity after execution. |
| `/szw-verify-work N` | Manual UAT for phase N. |
| `/szw-phase N [--no-verify-work]` | Fused: plan → execute → reassess → verify for phase N. |
| `/szw-audit-milestone [version]` | Audit against DOD and KPIs. |
| `/szw-complete-milestone` | Archive milestone, tag release. |
| `/szw-new-milestone [name]` | Start next milestone. |

### Navigation and utilities
| Command | Purpose |
|---------|---------|
| `/szw-progress` | Where am I? What's next? KPI summary. |
| `/szw-help` | This help. |
| `/szw-quick` | Ad-hoc task (plan + execute, no verify-work). |
| `/szw-add-phase`, `/szw-insert-phase N`, `/szw-remove-phase N` | Phase management. |
| `/szw-record-decision` | Append a decision to DECISIONS.md. |
| `/szw-pause-work`, `/szw-resume-work` | Handoff. |
| `/szw-debug [desc]` | Systematic debugging. |
| `/szw-settings` | Config. |

## Docs (in docs/)

- **Planning structure** — PLANNING-STRUCTURE.md
- **KPIs and targets** — KPIS-AND-TARGETS.md
- **Responsibility contracts** — RESPONSIBILITY-CONTRACTS.md
- **Definition of done** — DEFINITION-OF-DONE.md
- **Ownership model** — OWNERSHIP-MODEL.md
- **Flow and files matrix** — FLOW-AND-FILES.md

## Standalone

SchwarzWorker does not depend on GSD-OpenCode or any other framework. Install commands, workflows, agents, references, and templates into your OpenCode (or host) config.

---
</process>
