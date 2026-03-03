---
name: szw-plan-phase
description: Research + plan + plan-check for phase N.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - grep
  - glob
  - task
---
<objective>
Plan phase N: optional research, produce atomic plans, verify plans until they pass. Writes RESEARCH.md and PLAN files. Standalone.
</objective>

<execution_context>
@workflows/plan-phase.md
</execution_context>

<process>
Execute the plan-phase workflow from @workflows/plan-phase.md for phase N. Load context and goal; optional research; spawn szw-planner and szw-plan-checker; write {phase}-RESEARCH.md, {phase}-{n}-PLAN.md. Next: /szw-execute-phase N or /szw-phase N.
</process>
