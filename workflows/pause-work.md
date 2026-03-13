<purpose>
Save handoff state when stopping mid-phase: write STATE.md and (if mid-plan) write CONTINUE handoff file with exact resume details. Standalone.
</purpose>

<process>
Read current ROADMAP and phase directory for active phase.
Write STATE.md with: current_phase, current_plan, last_step, blockers, next_action, timestamp.
If pausing mid-plan, write `.planning/phases/{phase}/{phase}-CONTINUE.md` using templates/continue.md (step index, remaining work, decisions-with-why, exact next action).
Confirm. Resume later with /szw-resume-work.
</process>
