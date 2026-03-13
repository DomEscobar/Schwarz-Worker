<purpose>
Interactive settings: view/edit .planning/config.json (mode, depth, KPI thresholds, workflow toggles, model profiles). Standalone.
</purpose>

<process>
Read .planning/config.json (or create from references/planning-config.md defaults). Present current values.
Allow user to change:
- mode, depth
- kpi.*
- workflow.research, workflow.plan_check, workflow.verifier, workflow.reassessment, workflow.blocking_uat
- context.summary_injection_token_budget, context.summary_injection_strategy, context.drop_strategy
- skills.paths
- parallelization.enabled, planning.commit_docs

Write back config.json. Confirm.
</process>

<dependencies>
Reference: planning-config.
</dependencies>
