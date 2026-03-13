<purpose>
Initialize a new project: ask questions until the vision is clear, optionally research the domain, extract requirements with explicit validation semantics, and produce a roadmap with boundary contracts. Creates .planning/ and core files. Standalone; no external dependency.
</purpose>

<required_reading>
Read @references/planning-config.md and @templates/project.md, @templates/requirements.md, @templates/roadmap.md, @templates/state.md if present.
</required_reading>

<process>

## 1. Ensure .planning/ exists

Create `.planning/` at project root if missing. Create subdirs: `phases/`, `research/`, `milestones/`, `quick/`, `todos/pending/`, `skills/`.

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

Extract requirements with explicit traceability fields. Write REQUIREMENTS.md using template requirements.md:
- requirement IDs (REQ-xxx)
- class (core-capability, quality-attribute, continuity, etc.)
- phase assignment
- primary/supporting phase owners
- status (active, validated, partial, deferred, out-of-scope)
- validation evidence placeholder (unmapped at creation time)

## 5. Roadmap

Spawn szw-roadmapper (or equivalent) to produce ROADMAP.md:
- milestone version
- list of phases with short goals and success criteria
- required Boundary Map section that defines produces/consumes contracts across phase boundaries

Use template roadmap.md. Phase names/numbers (01, 02, ...) must align with REQUIREMENTS phase assignment.

## 6. Core files

Write or update:
- PROJECT.md (vision, goals, constraints) from template project.md.
- STATE.md (decisions, blockers, position) from template state.md.
- DECISIONS.md from template decisions.md (append-only register; seed with critical initial choices if any).
- config.json if missing (mode, depth, kpi thresholds, workflow toggles per planning-config.md).

## 7. Confirm

Present ROADMAP to the user. Proceed only when approved. Next step: /szw-discuss-phase 1 or /szw-phase 1.

</process>

<dependencies>
Agents: szw-roadmapper; optionally szw-project-researcher, szw-research-synthesizer. Templates: project, requirements, roadmap, state, decisions, research. References: planning-config.
</dependencies>
