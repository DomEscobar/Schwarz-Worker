# Planning Config

SchwarzWorker uses `.planning/config.json` for behavior and KPI thresholds.

## Core settings

| Key | Values | Default | Purpose |
|-----|--------|--------|---------|
| mode | interactive, yolo | interactive | Confirm each step vs auto-approve |
| depth | quick, standard, comprehensive | standard | Planning thoroughness (phases × plans) |

## KPI thresholds (optional)

| Key | Default | Purpose |
|-----|--------|---------|
| kpi.requirement_coverage_min | 100 | Min % requirements satisfied for milestone pass |
| kpi.critical_gaps_max | 0 | Max critical gaps (0 = none) |
| kpi.phase_verification_pass_rate_min | 100 | Min % phases with verification passed |
| kpi.tech_debt_max | 0 or 10 | Max tech_debt items (project policy) |

## Workflow toggles

| Key | Default | Purpose |
|-----|--------|---------|
| workflow.research | true | Run research in new-project and plan-phase |
| workflow.plan_check | true | Run plan-checker before execute |
| workflow.verifier | true | Run verifier after execute-phase |

## Execution

| Key | Default | Purpose |
|-----|--------|---------|
| parallelization.enabled | true | Run independent plans in parallel |
| planning.commit_docs | true | Commit .planning/ changes to git |

## Example config.json

```json
{
  "mode": "interactive",
  "depth": "standard",
  "kpi": {
    "requirement_coverage_min": 100,
    "critical_gaps_max": 0,
    "phase_verification_pass_rate_min": 100,
    "tech_debt_max": 10
  },
  "workflow": {
    "research": true,
    "plan_check": true,
    "verifier": true
  },
  "parallelization": { "enabled": true },
  "planning": { "commit_docs": true }
}
```
