# KPIs and Targets

SchwarzWorker defines explicit metrics so the autonomous developer can be measured and improved.

## Primary KPIs

| KPI | Definition | Source | Target (default) |
|-----|------------|--------|-------------------|
| **Requirement coverage** | % of milestone requirements with status satisfied (per audit). | REQUIREMENTS.md traceability + phase VERIFICATION.md + SUMMARY frontmatter | ≥ 100% |
| **Critical gaps** | Count of blocker-level gaps (missing artifacts, broken wiring, unsatisfied requirements). | Milestone audit `gaps.requirements` + `gaps.integration` + `gaps.flows` | 0 |
| **Phase verification pass rate** | % of phases in milestone with VERIFICATION.md status `passed` (no gaps_found). | Phase VERIFICATION.md frontmatter | 100% |
| **Tech debt count** | Number of non-blocker items in audit `tech_debt`. | Milestone audit `tech_debt` | ≤ project threshold (e.g. 10) or 0 for release |

## How They Are Computed

1. **Requirement coverage**  
   From milestone audit: `scores.requirements = satisfied_count / total_requirements`. Satisfied = requirement appears as satisfied in 3-source cross-reference (REQUIREMENTS.md, VERIFICATION.md, SUMMARY).

2. **Critical gaps**  
   Sum of: unsatisfied or orphaned requirements, integration gaps, broken E2E flows. Any such gap forces milestone status `gaps_found`.

3. **Phase verification pass rate**  
   Phases in scope with VERIFICATION.md `status: passed` (and no `gaps:` block or empty gaps) / total phases.

4. **Tech debt count**  
   Total items listed under audit `tech_debt` (all phases).

## Thresholds and Gates

- **Milestone DOD passed:** Requirement coverage ≥ 100%, critical gaps = 0, phase verification pass rate = 100%. Tech debt may be non-zero per project policy (see DEFINITION-OF-DONE.md).
- **Ship-ready (strict):** Above + tech_debt count ≤ project threshold (e.g. 0 or 10).

## Usage

- `/szw-audit-milestone` outputs these KPIs in the audit report.
- Responsibility contracts (RESPONSIBILITY-CONTRACTS.md) define who is accountable for each KPI.
