---
name: szw-remove-phase
description: Remove phase N; renumber subsequent phases.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - grep
  - glob
  - bash
---
<objective>
Remove phase N from roadmap and renumber. Standalone.
</objective>

<execution_context>
@workflows/remove-phase.md
</execution_context>

<process>
Execute the remove-phase workflow from @workflows/remove-phase.md for phase N.
</process>
