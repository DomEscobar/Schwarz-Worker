# Planning Structure

SchwarzWorker uses a single planning root (default: `.planning/`) for all project and milestone state. No external system is required.

## Root: `.planning/`

| Path | Purpose |
|------|---------|
| `PROJECT.md` | Vision, goals, constraints. Created by szw-new-project. |
| `REQUIREMENTS.md` | Scoped requirements (v1/v2/out of scope) with phase traceability. |
| `ROADMAP.md` | Milestone version, phase list with goals and success criteria. |
| `STATE.md` | Decisions, blockers, position; memory across sessions. |
| `config.json` | Mode (interactive/yolo), depth, KPI thresholds, workflow toggles, model profiles. |
| `phases/` | One directory per phase (e.g. `01-auth/`, `02-dashboard/`). |
| `research/` | Domain research (stack, architecture, pitfalls). |
| `milestones/` | Archived milestone data (e.g. `v1.0-phases/`). |
| `quick/` | Ad-hoc task plans and summaries (szw-quick). |
| `todos/` | Captured ideas (pending, done). |

## Phase directory (e.g. `.planning/phases/01-auth/`)

| File | Purpose |
|------|---------|
| `01-CONTEXT.md` | Implementation decisions from discuss-phase. |
| `01-RESEARCH.md` | Research for this phase. |
| `01-01-PLAN.md`, `01-02-PLAN.md` | Atomic task plans (XML: task, action, verify, done). |
| `01-01-SUMMARY.md`, `01-02-SUMMARY.md` | What was done per plan; commit refs. |
| `01-VERIFICATION.md` | Verifier report: must-haves, gaps, status (passed/gaps_found). |
| `01-UAT.md` | User acceptance test results. |

## Config: `.planning/config.json`

- `mode`: `interactive` | `yolo`
- `depth`: `quick` | `standard` | `comprehensive`
- `kpi`: optional overrides for requirement_coverage_min, critical_gaps_max, phase_verification_pass_rate_min, tech_debt_max
- `workflow.research`, `workflow.plan_check`, `workflow.verifier`: booleans
- `parallelization.enabled`, `planning.commit_docs`: booleans

## Naming conventions

- Phases: zero-padded numbers from ROADMAP (01, 02, … or 01-01, 01-02 for decimals).
- Plans: `{phase}-{n}-PLAN.md` (e.g. 01-01-PLAN.md).
- Summaries: `{phase}-{n}-SUMMARY.md`.
- Single verification per phase: `{phase}-VERIFICATION.md`.
- Milestone audit: `.planning/v{version}-MILESTONE-AUDIT.md`.

All paths are relative to the project root (repository root). The agent must have read/write access to `.planning/` and the codebase.
