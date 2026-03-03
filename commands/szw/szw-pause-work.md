---
name: szw-pause-work
description: Save handoff state when stopping mid-phase.
allowed-tools:
  - read
  - write
  - grep
---
<objective>
Write STATE.md with current phase, last step, blockers. Resume later with /szw-resume-work. Standalone.
</objective>

<execution_context>
@workflows/pause-work.md
</execution_context>

<process>
Execute the pause-work workflow from @workflows/pause-work.md.
</process>
