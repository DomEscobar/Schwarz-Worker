---
name: szw-insert-phase
description: Insert phase before N; renumber subsequent phases.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - grep
  - glob
  - bash
---
<objective>
Insert a new phase before phase N; renumber ROADMAP and REQUIREMENTS. Standalone.
</objective>

<execution_context>
@workflows/insert-phase.md
</execution_context>

<process>
Execute the insert-phase workflow from @workflows/insert-phase.md. Insert phase at N; renumber phases and phase directories.
</process>
