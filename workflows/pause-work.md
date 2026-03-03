<purpose>
Save handoff state when stopping mid-phase: write STATE.md with current phase, last completed step, open plans, blockers. Standalone.
</purpose>

<process>
Read current ROADMAP and phase directory for active phase. Write STATE.md with: current_phase, last_step (e.g. executed_plan_2_of_3), open_plans, blockers, timestamp. Optional: write continue-here or handoff note in phase directory. Confirm. Resume later with /szw-resume-work.
</process>
