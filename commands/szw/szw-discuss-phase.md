---
name: szw-discuss-phase
description: Capture implementation decisions for phase N; produces CONTEXT.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - grep
  - glob
---
<objective>
Capture how phase N should be implemented before planning: gray areas (UI, API, content), user decisions, CONTEXT.md. Standalone.
</objective>

<execution_context>
@workflows/discuss-phase.md
</execution_context>

<process>
Execute the discuss-phase workflow from @workflows/discuss-phase.md for phase N. Load ROADMAP and phase goal; identify gray areas; elicit decisions; write {phase}-CONTEXT.md. Next: /szw-plan-phase N or /szw-phase N.
</process>
