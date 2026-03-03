---
name: szw-new-milestone
description: Start next milestone — questions, requirements, roadmap.
argument-hint: "[name]"
allowed-tools:
  - read
  - write
  - grep
  - glob
  - task
---
<objective>
Start the next milestone: scope next version, update requirements and roadmap. Standalone.
</objective>

<execution_context>
@workflows/new-milestone.md
</execution_context>

<process>
Execute the new-milestone workflow from @workflows/new-milestone.md. Load state; elicit next scope; update REQUIREMENTS and ROADMAP. Next: /szw-phase 1.
</process>
