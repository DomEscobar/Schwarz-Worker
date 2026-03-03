<purpose>
Compute current position and next step from .planning/ROADMAP, STATE, and phase directories. Optionally summarize KPIs. Standalone.
</purpose>

<process>

## 1. Load ROADMAP and STATE

Read .planning/ROADMAP.md (milestone, phases). Read .planning/STATE.md if present (blockers, decisions).

## 2. Phase status per phase

For each phase in ROADMAP, check .planning/phases/{phase}/:
- CONTEXT.md → discussed
- *-PLAN.md → planned
- *-SUMMARY.md → executed
- VERIFICATION.md with status passed → verified (automated)
- UAT.md with passed → verified (manual)
Derive: not_started | discussed | planned | executed | verified.

## 3. Next step

- If there is a phase with status before verified: suggest /szw-discuss-phase N, /szw-plan-phase N, /szw-execute-phase N, or /szw-verify-work N (or /szw-phase N for fused).
- If all phases verified: suggest /szw-audit-milestone then /szw-complete-milestone.
- If no .planning/ or ROADMAP: suggest /szw-new-project (or /szw-map-codebase then /szw-new-project for brownfield).

## 4. Optional KPI summary

If any phase has VERIFICATION.md: count phases passed vs total. If .planning/v*-MILESTONE-AUDIT.md exists: report requirement coverage, critical gaps, tech_debt from last audit and compare to docs/DEFINITION-OF-DONE.md thresholds.

## 5. Output

Clear markdown: current milestone, phase table (phase, status), next step, optional KPI summary.

</process>
