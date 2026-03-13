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
| workflow.reassessment | true | Run reassessment after each phase to adjust roadmap/requirements |
| workflow.blocking_uat | true | Require verify-work pass before phase is considered done |

## Execution

| Key | Default | Purpose |
|-----|--------|---------|
| parallelization.enabled | true | Run independent plans in parallel |
| planning.commit_docs | true | Commit .planning/ changes to git |
| context.summary_injection_token_budget | 2500 | Token budget for dependency summary injection |
| context.summary_injection_strategy | highest_level_first | Load milestone summaries first, drill down only when needed |
| context.drop_strategy | oldest_or_least_relevant_first | If over budget, drop low-value/old summaries first |
| skills.paths | [".planning/skills", "skills"] | Ordered skill search paths for planner/executor/verifier |

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
    "verifier": true,
    "reassessment": true,
    "blocking_uat": true
  },
  "context": {
    "summary_injection_token_budget": 2500,
    "summary_injection_strategy": "highest_level_first",
    "drop_strategy": "oldest_or_least_relevant_first"
  },
  "skills": {
    "paths": [".planning/skills", "skills"]
  },
  "parallelization": { "enabled": true },
  "planning": { "commit_docs": true }
}
```
