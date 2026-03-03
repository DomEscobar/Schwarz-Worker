---
name: szw-add-phase
description: Append phase to roadmap.
allowed-tools:
  - read
  - write
  - grep
---
<objective>
Add a new phase at the end of the current milestone roadmap. Standalone.
</objective>

<execution_context>
@workflows/add-phase.md
</execution_context>

<process>
Execute the add-phase workflow from @workflows/add-phase.md. Update ROADMAP.md with new phase. Next: /szw-discuss-phase N or /szw-phase N.
</process>
