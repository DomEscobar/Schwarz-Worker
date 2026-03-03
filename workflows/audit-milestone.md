<purpose>
Audit the current (or given) milestone: aggregate phase VERIFICATION.md files, run integration check across phases, cross-reference requirements coverage from three sources, produce milestone audit report. Evaluate against DOD and KPIs. Standalone.
</purpose>

<required_reading>
Read docs/DEFINITION-OF-DONE.md, docs/KPIS-AND-TARGETS.md. Read @references/planning-config.md for thresholds.
</required_reading>

<process>

## 1. Initialize milestone context

Resolve milestone version from arguments or ROADMAP. List phases in scope. Load REQUIREMENTS.md traceability (REQ-IDs assigned to this milestone).

## 2. Read all phase verifications

For each phase in scope, read .planning/phases/{phase}/{phase}-VERIFICATION.md. Extract: status (passed/gaps_found), critical gaps, non-critical gaps, requirements coverage. If a phase has no VERIFICATION.md, flag as unverified (blocker).

## 3. Integration check

Spawn szw-integration-checker with: phase list, exports/APIs from SUMMARYs, milestone requirement IDs. Checker reports cross-phase wiring and E2E flow gaps. Collect report.

## 4. Requirements coverage (3-source)

- 4a. REQUIREMENTS.md traceability: REQ-ID, description, phase, checkbox.
- 4b. Each phase VERIFICATION.md: requirements table (requirement, source plan, status, evidence).
- 4c. Each phase SUMMARY frontmatter: requirements_completed.
For each REQ-ID, determine satisfied / partial / unsatisfied / orphaned per docs. Orphaned = in REQUIREMENTS but in no phase VERIFICATION → unsatisfied.

## 5. Aggregate and write audit

Create .planning/v{version}-MILESTONE-AUDIT.md with:
- status: passed | gaps_found | tech_debt
- scores: requirements (N/M), phases, integration, flows
- gaps: requirements[], integration[], flows[]
- tech_debt: list by phase
Full tables and evidence. Rules: any unsatisfied requirement or integration/flow gap → gaps_found. Tech_debt above threshold → status tech_debt or passed per project policy.

## 6. Evaluate DOD and KPIs

Apply docs/DEFINITION-OF-DONE.md and docs/KPIS-AND-TARGETS.md: requirement coverage ≥ 100%, critical gaps = 0, phase verification pass rate = 100%, tech_debt ≤ threshold. Output: DOD passed yes/no, KPIs met yes/no, and what to fix before /szw-complete-milestone.

</process>

<dependencies>
Agent: szw-integration-checker. Docs: DEFINITION-OF-DONE, KPIS-AND-TARGETS. Planning structure.
</dependencies>
