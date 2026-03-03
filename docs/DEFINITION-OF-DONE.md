# Definition of Done (Quantified)

Clear rules for when a phase or milestone is considered done.

## Phase-Level DOD

A **phase** is done when:

1. All plans for the phase have been executed (SUMMARYs exist for each plan).
2. Phase VERIFICATION.md exists and has `status: passed` (no critical gaps).
3. If `gaps:` is present, it is empty or only non-blocker items (e.g. deferred tech debt).
4. Manual UAT (verify-work) has been run and passed, or explicitly skipped by policy.

**Quantified:** Phase verification pass = VERIFICATION.md `status: passed` and no unsatisfied must-haves in the verifier’s report.

## Milestone-Level DOD

A **milestone** is done when:

1. All phases in the milestone have met phase-level DOD.
2. Milestone audit has been run (`/szw-audit-milestone` or `/gsd-audit-milestone`).
3. Audit status is `passed` (not `gaps_found`).
4. KPI targets are met:
   - Requirement coverage ≥ 100%
   - Critical gaps = 0
   - Phase verification pass rate = 100%
5. Tech debt count ≤ project threshold (e.g. 0 for strict release, or ≤ 10; configurable).

**Status values:**

| Status | Meaning |
|--------|--------|
| `passed` | All requirements satisfied, no critical gaps, KPIs met. Tech debt within limit. |
| `gaps_found` | At least one unsatisfied requirement, integration gap, or flow gap; or KPIs not met. Do not complete milestone. |
| `tech_debt` | No blockers but tech_debt count above threshold. Review before release. |

## Project Thresholds (Configurable)

Suggested location: `.planning/config.json` or project docs.

- `kpi.requirement_coverage_min`: 100
- `kpi.critical_gaps_max`: 0
- `kpi.phase_verification_pass_rate_min`: 100
- `kpi.tech_debt_max`: 0 or 10 (per project)

Audit and `/szw-audit-milestone` should read these and report pass/fail against them.
