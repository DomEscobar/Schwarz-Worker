# Ownership Model

Who owns the outcome at each level.

## Milestone Owner

- **Role:** The party responsible for the milestone’s definition of done and for not closing the milestone until DOD and KPIs are met.
- **Typical holder:** Human developer or lead. Can be delegated to an orchestrator that enforces gates (e.g. block complete-milestone if audit status is not `passed`).
- **Actions:** Run audit; interpret KPI results; decide when to fix gaps vs. defer; call complete-milestone only when thresholds are satisfied.

## Phase Owner

- **Role:** Responsible for one phase: ensure discuss → plan → execute → verify are run and that the phase reaches DOD (VERIFICATION passed, UAT passed).
- **Typical holder:** Same developer running the phase (e.g. via `/szw-phase N`). No separate role; the runner is accountable.
- **Actions:** Run szw-phase (or plan/execute/verify separately); fix or re-run if verifier finds gaps; do not mark phase done without verification.

## No Single “Agent Owner”

Agents (planner, executor, verifier, integration-checker) have **responsibility contracts** (see RESPONSIBILITY-CONTRACTS.md) but do not “own” the milestone. Ownership of the **outcome** (milestone DOD, ship decision) stays with the human or the designated milestone owner.

## Escalation

- If the verifier reports gaps: executor (or human) fixes and re-runs execute/verify.
- If the audit reports gaps_found: milestone owner drives fixes (new phases, plan-milestone-gaps, or re-execute) and re-audits until passed.
- If KPIs are not met: milestone owner reviews thresholds and either fixes work or adjusts policy (e.g. temporary tech_debt allowance) and documents the decision.
