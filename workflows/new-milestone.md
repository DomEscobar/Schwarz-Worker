<purpose>
Start the next milestone: same flow as new-project but for existing codebase — questions focus on what to build next, research optional, requirements and roadmap for new version with boundary contracts. Creates new ROADMAP and phase list; .planning/ state is updated. Standalone.
</purpose>

<process>

## 1. Load current state

Read PROJECT.md, STATE.md, DECISIONS.md (if present), current ROADMAP. Confirm previous milestone is complete (or user acknowledges).

## 2. Questioning for next version

Ask: What do you want to build next? Scope, priorities, v1 vs v2 for this milestone. Use STATE to persist.

## 3. Optional research

If enabled: research domain for new scope; update .planning/research/ if needed.

## 4. Requirements and roadmap

Update REQUIREMENTS.md with new or revised requirements and phase assignment.
Spawn szw-roadmapper to produce new ROADMAP: new milestone version, new phase list with goals and success criteria, and Boundary Map produces/consumes contracts.
Write ROADMAP.md, update STATE.md.

## 5. Confirm

Present new ROADMAP. Next: /szw-phase 1 (or discuss-phase 1) for the new milestone.

</process>

<dependencies>
Agent: szw-roadmapper. Templates: requirements, roadmap, decisions.
</dependencies>
