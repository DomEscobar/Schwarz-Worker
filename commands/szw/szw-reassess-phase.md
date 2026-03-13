---
name: szw-reassess-phase
description: Reassess phase outcomes and update downstream roadmap/requirements if needed.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - grep
  - glob
---
<objective>
After phase N execution, reassess whether downstream plans still hold. Write {phase}-REASSESSMENT.md and update ROADMAP/REQUIREMENTS when required.
</objective>

<execution_context>
@workflows/reassess-phase.md
</execution_context>

<process>
Execute the reassess-phase workflow from @workflows/reassess-phase.md for phase N.
Use verification and summaries to determine verdict (no-change or modified), then apply and document updates.
</process>
