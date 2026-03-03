---
name: szw-resume-work
description: Restore context from last handoff.
allowed-tools:
  - read
  - grep
---
<objective>
Load STATE.md and present current phase and next step. Standalone.
</objective>

<execution_context>
@workflows/resume-work.md
</execution_context>

<process>
Execute the resume-work workflow from @workflows/resume-work.md.
</process>
