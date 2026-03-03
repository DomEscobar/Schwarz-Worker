---
name: szw-complete-milestone
description: Archive milestone, tag release.
allowed-tools:
  - read
  - write
  - bash
  - grep
  - glob
---
<objective>
Archive the current milestone: move phase dirs to milestones/v{version}-phases/, write archive doc, optional git tag. Standalone.
</objective>

<execution_context>
@workflows/complete-milestone.md
</execution_context>

<process>
Execute the complete-milestone workflow from @workflows/complete-milestone.md. Ensure audit passed or user confirms. Archive phases; write milestone archive; optional tag. Next: /szw-new-milestone.
</process>
