---
name: szw-map-codebase
description: Analyze existing codebase (stack, architecture, conventions). Run before new-project on brownfield.
allowed-tools:
  - read
  - write
  - grep
  - glob
  - task
---
<objective>
Analyze the current codebase and write findings under .planning/codebase/ (or research/). Used before new-project so roadmap focuses on what to add or change. Standalone.
</objective>

<execution_context>
@workflows/map-codebase.md
</execution_context>

<process>
Execute the map-codebase workflow from @workflows/map-codebase.md. Spawn szw-codebase-mapper; write STACK.md, ARCHITECTURE.md, CONVENTIONS.md, CONCERNS.md, STRUCTURE.md under .planning/. Report. Next: /szw-new-project.
</process>
