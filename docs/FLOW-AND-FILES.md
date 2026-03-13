# Flow and Files Reference

Which markdown (and config) files are **read** or **written** in each flow. Paths are under `.planning/` unless noted.

---

## 1. Flow overview (by command)

| Command | Flow | Main files created/updated |
|---------|------|----------------------------|
| `/szw-map-codebase` | map-codebase | **W** `.planning/codebase/*.md` (or research/codebase/) |
| `/szw-new-project` | new-project | **W** PROJECT, REQUIREMENTS, ROADMAP, DECISIONS, STATE, config.json; **W** research/* |
| `/szw-discuss-phase N` | discuss-phase | **R** ROADMAP; **W** phases/{N}-CONTEXT.md, **W** STATE |
| `/szw-plan-phase N` | plan-phase | **R** ROADMAP, REQUIREMENTS, CONTEXT; **W** phases/{N}-RESEARCH.md, **W** phases/{N}-*-PLAN.md |
| `/szw-execute-phase N` | execute-phase | **R** ROADMAP, phases/{N}-*-PLAN.md; **W** phases/{N}-*-SUMMARY.md, **W** phases/{N}-VERIFICATION.md |
| `/szw-reassess-phase N` | reassess-phase | **R** ROADMAP, REQUIREMENTS, phases/{N}-VERIFICATION.md + SUMMARYs; **W** phases/{N}-REASSESSMENT.md and optional ROADMAP/REQUIREMENTS updates |
| `/szw-verify-work N` | verify-work | **R** ROADMAP, VERIFICATION, SUMMARYs; **W** phases/{N}-UAT.md |
| `/szw-phase N` | phase-flow | Runs discuss → plan → execute → reassess → verify; touches all phase files for N |
| `/szw-audit-milestone` | audit-milestone | **R** ROADMAP, REQUIREMENTS, all phase VERIFICATION/SUMMARY; **W** v{version}-MILESTONE-AUDIT.md |
| `/szw-complete-milestone` | complete-milestone | **R** ROADMAP, audit; **W** milestones/v{version}-phases/, milestones/v{version}-archive.md |
| `/szw-new-milestone` | new-milestone | **R** PROJECT, STATE, ROADMAP; **W** REQUIREMENTS, ROADMAP, STATE |
| `/szw-quick` | quick | **W** quick/{id}-{slug}/PLAN.md, SUMMARY.md |
| `/szw-progress` | progress | **R** ROADMAP, STATE, all phases/* (CONTEXT, PLAN, SUMMARY, VERIFICATION, UAT), optional v*-MILESTONE-AUDIT |
| `/szw-add-phase` | add-phase | **R** ROADMAP; **W** ROADMAP |
| `/szw-insert-phase N` | insert-phase | **R** ROADMAP, REQUIREMENTS; **W** ROADMAP, REQUIREMENTS; renames phases/ dirs |
| `/szw-remove-phase N` | remove-phase | **R** ROADMAP, REQUIREMENTS; **W** ROADMAP, REQUIREMENTS; removes phases/{N} |
| `/szw-record-decision` | record-decision | **R/W** DECISIONS (append-only) |
| `/szw-pause-work` | pause-work | **R** ROADMAP, current phase dir; **W** STATE, optional phases/{N}-CONTINUE.md |
| `/szw-resume-work` | resume-work | **R** STATE, optional phases/{N}-CONTINUE.md |
| `/szw-settings` | settings | **R** config.json; **W** config.json |

**R** = read, **W** = write (or create/update).

---

## 2. Per-flow: files read and written

### 2.1 map-codebase

| Step | Read | Write |
|------|------|--------|
| 1 | — | Create `.planning/` and subdirs |
| 2 | Codebase (repo files) | — |
| 3 | — | `.planning/codebase/STACK.md`, `ARCHITECTURE.md`, `CONVENTIONS.md`, `CONCERNS.md`, `STRUCTURE.md` (or under research/codebase/) |

**References/templates (agent):** optional `templates/codebase/` if present.

---

### 2.2 new-project

| Step | Read | Write |
|------|------|--------|
| 1 | — | Create `.planning/`, `phases/`, `research/`, `milestones/`, `quick/`, `todos/pending/`, `skills/` |
| 2 | — | User input → persist in STATE.md (if exists) |
| 3 | `references/planning-config.md`, `templates/*` | `.planning/research/*` (if research enabled) |
| 4 | — | `.planning/REQUIREMENTS.md` (from templates/requirements.md) |
| 5 | REQUIREMENTS, research | `.planning/ROADMAP.md` (from templates/roadmap.md) |
| 6 | templates/project, state, decisions | `.planning/PROJECT.md`, `.planning/STATE.md`, `.planning/DECISIONS.md`, `.planning/config.json` |

**References/templates:** `references/planning-config.md`, `templates/project.md`, `requirements.md`, `roadmap.md`, `state.md`, `decisions.md`, `research.md`.

---

### 2.3 discuss-phase N

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md` | — |
| 2–3 | ROADMAP (phase goal), DECISIONS (if present) | — |
| 4 | — | `.planning/phases/{phase}/{phase}-CONTEXT.md` (e.g. 01-CONTEXT.md) |
| (optional) | — | `.planning/STATE.md` and append `.planning/DECISIONS.md` |

**Templates:** `templates/context.md`.

---

### 2.4 plan-phase N

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md`, `.planning/phases/{phase}/{phase}-CONTEXT.md`, `.planning/REQUIREMENTS.md`, `.planning/DECISIONS.md` | — |
| 2 | CONTEXT, goal, boundary contracts | `.planning/phases/{phase}/{phase}-RESEARCH.md` (if research enabled) |
| 3 | ROADMAP, CONTEXT, RESEARCH, REQUIREMENTS, dependency summaries | `.planning/phases/{phase}/{phase}-01-PLAN.md`, `{phase}-02-PLAN.md`, ... |
| 4 | PLAN(s), goal, must-haves | — (plan-checker reads only; planner may overwrite PLANs on revise) |

**References/templates:** `references/verification-patterns.md`, `references/checkpoints.md`, `templates/plan.md`, `templates/research.md`.

---

### 2.5 execute-phase N

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/phases/{phase}/*-PLAN.md`, `.planning/ROADMAP.md`, `.planning/DECISIONS.md` | — |
| 2 | Each PLAN, codebase, AGENTS.md, boundary contracts | `.planning/phases/{phase}/{phase}-01-SUMMARY.md`, `{phase}-02-SUMMARY.md`, ...; git commits |
| 3 | ROADMAP, PLAN(s) must_haves, boundary contracts, codebase | `.planning/phases/{phase}/{phase}-VERIFICATION.md` |
| 4 | VERIFICATION.md | — (caller may retry or add fix plans) |

**References/templates:** `references/verification-patterns.md`, `references/checkpoints.md`, `templates/summary.md`, `verification.md`.

---

### 2.6 verify-work N

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md`, `.planning/phases/{phase}/{phase}-VERIFICATION.md`, `phases/{phase}/*-SUMMARY.md` | — |
| 2–3 | — | User answers; optional debug → fix plan in phase dir |
| 4 | — | `.planning/phases/{phase}/{phase}-UAT.md` |

**Templates:** `templates/uat.md`.

---

### 2.6b reassess-phase N

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md`, `.planning/REQUIREMENTS.md`, `.planning/DECISIONS.md`, `.planning/phases/{phase}/{phase}-VERIFICATION.md`, `phases/{phase}/*-SUMMARY.md` | — |
| 2 | Verification + summaries (drift detection) | optional updates to `.planning/ROADMAP.md`, `.planning/REQUIREMENTS.md`, `.planning/DECISIONS.md` |
| 3 | — | `.planning/phases/{phase}/{phase}-REASSESSMENT.md` |

**Templates:** `templates/reassessment.md`.

---

### 2.7 phase-flow (fused: /szw-phase N)

Runs **discuss-phase** → **plan-phase** → **execute-phase** (loop until verification passed or max retries) → **reassess-phase** → **verify-work**.

So for phase N it touches the **union** of files from 2.3, 2.4, 2.5, reassess-phase, 2.6:

- **Read:** ROADMAP, REQUIREMENTS, DECISIONS, STATE; phases/{N}-CONTEXT, RESEARCH, *-PLAN; codebase; SUMMARYs, VERIFICATION.
- **Write:** CONTEXT (if discuss run), RESEARCH, *-PLAN, *-SUMMARY, VERIFICATION, REASSESSMENT, UAT; STATE if updated.

---

### 2.8 audit-milestone

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md`, `.planning/REQUIREMENTS.md`, `.planning/DECISIONS.md` | — |
| 2 | `.planning/phases/{phase}/{phase}-VERIFICATION.md` for each phase in scope | — |
| 3 | Phase SUMMARYs (exports/APIs), requirement IDs, boundary contracts | — (integration checker report in memory) |
| 4 | REQUIREMENTS traceability, each phase VERIFICATION requirements table, each phase SUMMARY frontmatter (requirements_completed) | — |
| 5 | — | `.planning/v{version}-MILESTONE-AUDIT.md` |
| 6 | `docs/DEFINITION-OF-DONE.md`, `docs/KPIS-AND-TARGETS.md`, `references/planning-config.md`, audit report | — (output to user) |

---

### 2.9 complete-milestone

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md`, optionally v*-MILESTONE-AUDIT.md | — |
| 2 | `.planning/phases/*` (all phase dirs) | Move to `.planning/milestones/v{version}-phases/` |
| 3 | — | `.planning/milestones/v{version}-archive.md` |
| 4 | config.json (planning.commit_docs) | Git tag (optional) |
| 5 | — | phases/ cleared or prepared for next milestone |

---

### 2.10 new-milestone

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/PROJECT.md`, `.planning/STATE.md`, `.planning/ROADMAP.md`, `.planning/DECISIONS.md` | — |
| 2 | — | `.planning/STATE.md` (update) |
| 3 | — | `.planning/research/*` (if research enabled) |
| 4 | RESEARCH, STATE, DECISIONS | `.planning/REQUIREMENTS.md` (update), `.planning/ROADMAP.md` (new version), `.planning/STATE.md` |

**Templates:** requirements, roadmap.

---

### 2.11 quick

| Step | Read | Write |
|------|------|--------|
| 1 | — | User task description |
| 2 | Codebase context | `.planning/quick/{id}-{slug}/PLAN.md` |
| 3 | PLAN.md, codebase | `.planning/quick/{id}-{slug}/SUMMARY.md`; git commit |

---

### 2.12 progress

| Step | Read | Write |
|------|------|--------|
| 1 | `.planning/ROADMAP.md`, `.planning/STATE.md` | — |
| 2 | For each phase: `.planning/phases/{phase}/` (CONTEXT, *-PLAN, *-SUMMARY, VERIFICATION, REASSESSMENT, UAT) | — |
| 3–4 | Optional: `.planning/v*-MILESTONE-AUDIT.md`, `docs/DEFINITION-OF-DONE.md` | — |
| 5 | — | Output to user (no file write) |

---

### 2.13 add-phase / insert-phase N / remove-phase N

- **add-phase:** Read ROADMAP; write ROADMAP (append phase).
- **insert-phase N:** Read ROADMAP, REQUIREMENTS; write ROADMAP, REQUIREMENTS; rename/update `.planning/phases/` dirs as needed.
- **remove-phase N:** Read ROADMAP, REQUIREMENTS; write ROADMAP, REQUIREMENTS; remove `.planning/phases/{phase}/`.
- **record-decision:** Read/append `.planning/DECISIONS.md`; never edit/remove historical rows.

---

### 2.14 pause-work / resume-work

- **pause-work:** Read ROADMAP, current phase dir; write STATE.md and optional `{phase}-CONTINUE.md`.
- **resume-work:** Read STATE.md and optional `{phase}-CONTINUE.md`.

---

### 2.15 settings

- Read `.planning/config.json`; write `.planning/config.json`. Optional read: `references/planning-config.md`.

---

## 3. Lifecycle of one phase (file order)

For a single phase N (e.g. `01`), files appear in this order:

```
.planning/ROADMAP.md                    (already exists from new-project)
.planning/REQUIREMENTS.md               (already exists)
.planning/DECISIONS.md                  (already exists; append-only)
.planning/phases/01/01-CONTEXT.md       ← discuss-phase
.planning/phases/01/01-RESEARCH.md       ← plan-phase (optional)
.planning/phases/01/01-01-PLAN.md       ← plan-phase
.planning/phases/01/01-02-PLAN.md       ← plan-phase (if multiple plans)
.planning/phases/01/01-01-SUMMARY.md    ← execute-phase (after plan 1)
.planning/phases/01/01-02-SUMMARY.md    ← execute-phase (after plan 2)
.planning/phases/01/01-VERIFICATION.md   ← execute-phase (verifier)
.planning/phases/01/01-REASSESSMENT.md   ← reassess-phase
.planning/phases/01/01-UAT.md           ← verify-work
```

Codebase files (source code) are read/written by the executor and verifier; they are not listed in `.planning/`.

---

## 4. Where each file comes from

| File | Created by | Updated by |
|------|------------|------------|
| `.planning/PROJECT.md` | new-project | (manual or new-milestone context) |
| `.planning/REQUIREMENTS.md` | new-project | new-milestone, insert/remove-phase |
| `.planning/ROADMAP.md` | new-project | new-milestone, add/insert/remove-phase |
| `.planning/DECISIONS.md` | new-project | discuss-phase, plan/execution decisions, reassess-phase |
| `.planning/STATE.md` | new-project | discuss-phase, new-milestone, pause-work |
| `.planning/config.json` | new-project | settings |
| `.planning/codebase/*.md` | map-codebase | — |
| `.planning/research/*` | new-project, new-milestone | new-milestone (research) |
| `.planning/phases/{N}-CONTEXT.md` | discuss-phase | — |
| `.planning/phases/{N}-RESEARCH.md` | plan-phase | — |
| `.planning/phases/{N}-*-PLAN.md` | plan-phase | plan-phase (revise loop) |
| `.planning/phases/{N}-*-SUMMARY.md` | execute-phase | — |
| `.planning/phases/{N}-VERIFICATION.md` | execute-phase | execute-phase (re-run) |
| `.planning/phases/{N}-REASSESSMENT.md` | reassess-phase | reassess-phase (re-run) |
| `.planning/phases/{N}-CONTINUE.md` | pause-work | resume-work (consumes/deletes) |
| `.planning/phases/{N}-UAT.md` | verify-work | verify-work (fix plans) |
| `.planning/v*-MILESTONE-AUDIT.md` | audit-milestone | — |
| `.planning/milestones/v*-phases/` | complete-milestone (move) | — |
| `.planning/milestones/v*-archive.md` | complete-milestone | — |
| `.planning/quick/*/PLAN.md` | quick | — |
| `.planning/quick/*/SUMMARY.md` | quick | — |

---

## 5. Static assets (never written by flows)

These are **only read** by commands/workflows/agents:

- **docs/** — PLANNING-STRUCTURE, KPIS-AND-TARGETS, RESPONSIBILITY-CONTRACTS, DEFINITION-OF-DONE, OWNERSHIP-MODEL (read by audit, progress, help).
- **references/** — verification-patterns, planning-config, checkpoints (read by workflows/agents).
- **templates/** — project, requirements, roadmap, state, decisions, context, research, plan, summary, verification, reassessment, continue, uat (read when **writing** .planning files).
- **skills/** and **.planning/skills/** — optional domain/quality skills loaded by planner/executor/verifier.
- **workflows/** — read by commands via `@workflows/...`.
- **agents/** — invoked by workflows; agent markdown is read by the host when spawning.
