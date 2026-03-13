<purpose>
Restore context from last handoff: load STATE.md and CONTINUE file if present, present current phase and exact next step, optionally load phase CONTEXT and PLANs. Standalone.
</purpose>

<process>
Read .planning/STATE.md.
If `.planning/phases/{phase}/{phase}-CONTINUE.md` exists, load it first and use its "Next action (exact)" as authoritative resume point, then delete it after successful resume.
Report: milestone, phase, last step, blockers, next action. Suggest next command (e.g. /szw-execute-phase N, /szw-verify-work N). Optionally load phase directory files for context.
</process>
