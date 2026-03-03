---
name: szw-settings
description: View or edit .planning/config.json (mode, depth, KPI thresholds, workflow toggles).
allowed-tools:
  - read
  - write
---
<objective>
Interactive settings for .planning/config.json. Standalone.
</objective>

<execution_context>
@workflows/settings.md
</execution_context>

<process>
Execute the settings workflow from @workflows/settings.md. Read config; present; allow edits; write back.
</process>
