---
name: szw-audit-milestone
description: Audit milestone against quantified DOD and KPI thresholds
argument-hint: "[version]"
allowed-tools:
  - read
  - glob
  - grep
  - bash
  - write
  - task
---
<objective>
Run the milestone audit (aggregate phase verifications, integration check, requirements coverage, produce audit report) and evaluate the result against SchwarzWorker's quantified definition of done and KPI targets. Report whether the milestone may be completed (passed) or must not be completed (gaps_found / KPIs not met).
</objective>

<execution_context>
@workflows/audit-milestone.md
</execution_context>

<context>
- **version** — Optional. Milestone version to audit; default from ROADMAP.
- Audit produces .planning/v{version}-MILESTONE-AUDIT.md with status, scores, gaps, tech_debt. Uses docs/DEFINITION-OF-DONE.md and docs/KPIS-AND-TARGETS.md.
</context>

<process>
1. Execute the audit-milestone workflow from @workflows/audit-milestone.md (aggregate phase VERIFICATION.md files, spawn szw-integration-checker for cross-phase wiring, cross-reference REQUIREMENTS.md and phase verification tables, produce audit report).
2. Read the audit report; extract status, scores, gaps, tech_debt.
3. Compare to KPI targets (see docs/KPIS-AND-TARGETS.md and docs/DEFINITION-OF-DONE.md):
   - Requirement coverage ≥ 100%
   - Critical gaps = 0
   - Phase verification pass rate = 100%
   - Tech debt ≤ project threshold
4. Output: audit summary, "DOD passed: yes/no", "KPIs met: yes/no". If not passed, list what must be fixed before /szw-complete-milestone.
</process>
