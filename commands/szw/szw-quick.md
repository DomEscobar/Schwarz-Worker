---
name: szw-quick
description: Ad-hoc task — plan + execute, no verify-work. Uses .planning/quick/.
allowed-tools:
  - read
  - write
  - bash
  - grep
  - glob
  - task
---
<objective>
Execute a small task without full phase flow: one plan + execute, no discuss/verify-work. Standalone.
</objective>

<execution_context>
@workflows/quick.md
</execution_context>

<process>
Execute the quick workflow from @workflows/quick.md. Elicit task; spawn szw-planner then szw-executor; write .planning/quick/{id}-{slug}/PLAN.md and SUMMARY.md.
</process>
