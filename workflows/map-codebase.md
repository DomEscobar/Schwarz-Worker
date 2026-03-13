<purpose>
Analyze an existing codebase: stack, architecture, conventions, concerns, integrations. Output goes under .planning/codebase/ (or .planning/research/). Used before new-project on brownfield so that questioning and roadmap focus on what to add/change. Standalone.
</purpose>

<process>

## 1. Ensure .planning/ exists

Create `.planning/` and subdirs if missing, including `.planning/skills/` for project-local skill files.

## 2. Spawn codebase mapper

Spawn szw-codebase-mapper (or parallel subagents) to analyze:
- Stack (languages, frameworks, tools).
- Architecture (layers, entry points, data flow).
- Conventions (naming, file layout, testing).
- Concerns (security, performance, integrations).
- Structure (directories, key files).

## 3. Write artifacts

Write under .planning/codebase/ (or .planning/research/codebase/): e.g. STACK.md, ARCHITECTURE.md, CONVENTIONS.md, CONCERNS.md, STRUCTURE.md. Use templates from templates/codebase/ if present.

## 4. Report

Summarize findings. Tell user to run /szw-new-project next; questions will focus on what to build on top of the existing codebase.

</process>

<dependencies>
Agent: szw-codebase-mapper. Optional: templates for codebase docs.
</dependencies>
