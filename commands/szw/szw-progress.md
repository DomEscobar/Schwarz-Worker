---
name: szw-progress
description: Show current position, next step, and optional KPI summary
allowed-tools:
  - read
  - glob
  - grep
---
<objective>
Answer "where am I?" and "what's next?" using .planning/ROADMAP.md, STATE.md, and phase directories. Optionally summarize milestone KPIs (requirement coverage, gaps, phase verification status) when a milestone is in progress.
</objective>

<execution_context>
@workflows/progress.md
</execution_context>

<process>
1. Read .planning/ROADMAP.md and .planning/STATE.md (if present).
2. List phases from ROADMAP; for each phase, check .planning/phases/ for PLAN, SUMMARY, VERIFICATION, UAT to determine status (not started / planned / executed / verified).
3. Report: current milestone, phases and their status, suggested next step (/szw-phase N, or /szw-audit-milestone then /szw-complete-milestone).
4. If phases have VERIFICATION.md, optionally show requirement coverage hint, critical gaps count, phase verification pass count. If .planning/v*-MILESTONE-AUDIT.md exists, reference it and KPI targets from docs/DEFINITION-OF-DONE.md.
</process>
