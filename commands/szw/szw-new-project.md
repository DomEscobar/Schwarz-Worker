---
name: szw-new-project
description: Initialize project — questions, research, requirements, roadmap. Creates .planning/.
allowed-tools:
  - read
  - write
  - grep
  - glob
  - task
---
<objective>
Initialize a new project: ask until vision is clear, optionally research domain, extract requirements with phase traceability, produce roadmap. Creates .planning/ and core files. Standalone.
</objective>

<execution_context>
@workflows/new-project.md
</execution_context>

<process>
Execute the new-project workflow from @workflows/new-project.md. Ensure .planning/ exists; run questioning; optional research; requirements and roadmap; write PROJECT.md, REQUIREMENTS.md, ROADMAP.md, STATE.md, config.json. Present ROADMAP for approval. Next: /szw-discuss-phase 1 or /szw-phase 1.
</process>
