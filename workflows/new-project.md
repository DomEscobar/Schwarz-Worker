<purpose>
Initialize a new project: ask questions until the vision is clear, optionally research the domain, extract requirements (v1/v2/out of scope), and produce a roadmap (phases with goals and success criteria). Creates .planning/ and core files. Standalone; no external dependency.
</purpose>

<required_reading>
Read @references/planning-config.md and @templates/project.md, @templates/requirements.md, @templates/roadmap.md, @templates/state.md if present.
</required_reading>

<process>

## 1. Ensure .planning/ exists

Create `.planning/` at project root if missing. Create subdirs: `phases/`, `research/`, `milestones/`, `quick/`, `todos/pending/`.

## 2. Questioning

Ask the user until the following are clear:
- Goal and vision (what we are building).
- Constraints (tech, time, scope).
- Preferences (stack, conventions, edge cases).
- v1 vs v2 vs out of scope.

Use STATE.md to persist decisions and blockers across sessions.

## 3. Optional research

If workflow.research is enabled (config or default): spawn agents (e.g. szw-project-researcher, szw-research-synthesizer) to investigate domain: stack, architecture, pitfalls. Write results under .planning/research/. Templates in templates/ can guide structure.

## 4. Requirements

Extract requirements with phase traceability. Write REQUIREMENTS.md using template requirements.md: requirement IDs (REQ-xxx), description, v1/v2/out of scope, and later phase assignment.

## 5. Roadmap

Spawn szw-roadmapper (or equivalent) to produce ROADMAP.md: milestone version, list of phases, each with a short goal and optional success_criteria. Use template roadmap.md. Phase names/numbers (01, 02, ...) must align with REQUIREMENTS phase assignment.

## 6. Core files

Write or update:
- PROJECT.md (vision, goals, constraints) from template project.md.
- STATE.md (decisions, blockers, position) from template state.md.
- config.json if missing (mode, depth, kpi thresholds, workflow toggles per planning-config.md).

## 7. Confirm

Present ROADMAP to the user. Proceed only when approved. Next step: /szw-discuss-phase 1 or /szw-phase 1.

</process>

<dependencies>
Agents: szw-roadmapper; optionally szw-project-researcher, szw-research-synthesizer. Templates: project, requirements, roadmap, state. References: planning-config.
</dependencies>
