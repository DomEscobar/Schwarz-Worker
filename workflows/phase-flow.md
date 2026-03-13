<purpose>
Run a full phase in one flow: plan → execute (with retry until automated verification passes) → reassess → verify-work. Single entry point for phase N. Uses only SchwarzWorker workflows and agents.
</purpose>

<required_reading>
Read all files referenced by the invoking command's execution_context before starting.
</required_reading>

<process>

## 1. Resolve Phase and Context

- **Phase number N** from command arguments (e.g. szw-phase 1 → N=1).
- **Max execute retries** (default 3): re-run execute when phase verifier reports gaps.
- **Skip verify-work** if --no-verify-work: run plan + execute only.
- **Workflow toggles from config**: workflow.reassessment, workflow.blocking_uat.

Ensure `.planning/` exists, ROADMAP.md exists, and ROADMAP defines phase N. If not, abort with a clear message.

## 2. Plan Phase

Run the **plan-phase** workflow for phase N (see @workflows/plan-phase.md):

- Load phase goal and CONTEXT from .planning/phases/ and ROADMAP.
- Research (if enabled): spawn szw-phase-researcher or equivalent; produce RESEARCH.md.
- Spawn szw-planner to produce atomic plans; spawn szw-plan-checker to validate.
- Loop until plans pass. Output: `{phase}-RESEARCH.md`, `{phase}-{n}-PLAN.md`.

If planning fails (no plans or checker never passes), stop and report. Do not proceed.

## 3. Execute Phase with Verification Loop

Run the **execute-phase** workflow for phase N (see @workflows/execute-phase.md):

- For each plan in the phase directory, spawn szw-executor to implement (waves, parallel where independent).
- After execution, spawn szw-verifier to check codebase against phase goal and must-haves; write VERIFICATION.md.

**Loop:**

- If phase VERIFICATION.md has status passed and no critical gaps → go to step 4.
- If gaps_found and retry count < max retries → use fix plans or re-plan, re-run execute-phase for phase N, increment retry count, repeat.
- If gaps_found and retries exhausted → stop, report gaps, suggest user run /szw-execute-phase N or /szw-verify-work N after fixing.
- If no VERIFICATION.md yet after one run, continue to step 4 once execution completes.

## 4. Reassess (Roadmap/Requirements correction)

If workflow.reassessment is enabled:

- Run reassess-phase workflow for phase N.
- If reassessment verdict is `modified`, update ROADMAP/REQUIREMENTS (and DECISIONS if needed) before continuing.
- If reassessment indicates downstream plans are invalid, stop and ask user to rerun /szw-plan-phase for affected phases.

## 5. Verify Work (Manual UAT)

Unless --no-verify-work:

- Run the **verify-work** workflow for phase N (see @workflows/verify-work.md).
- User confirms deliverables; if issues, workflow may produce fix plans for re-execution.
- If workflow.blocking_uat is true, phase is "done" only when verify-work passes.
- If workflow.blocking_uat is false, phase can be marked automation-done while UAT stays pending.

If --no-verify-work: skip; phase is "automation-done" only.

## 6. Report

Summarize: phase N planned, executed, (optionally) verified. Next: /szw-phase N+1 or /szw-audit-milestone when all phases are done.

</process>

<dependencies>
Requires SchwarzWorker workflows (plan-phase, execute-phase, reassess-phase, verify-work) and agents (szw-planner, szw-plan-checker, szw-executor, szw-verifier). Planning structure: .planning/ per docs/PLANNING-STRUCTURE.md.
</dependencies>
