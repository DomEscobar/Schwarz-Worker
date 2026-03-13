---
name: szw-execute-phase
description: Run plans for phase N; internal verification; atomic commits.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - bash
  - grep
  - glob
  - task
---
<objective>
Execute all plans for phase N in waves; commit per task; run phase verification. Writes SUMMARYs and VERIFICATION.md. Stops early if blocker_discovered indicates remaining plans are invalid. Standalone.
</objective>

<execution_context>
@workflows/execute-phase.md
</execution_context>

<process>
Execute the execute-phase workflow from @workflows/execute-phase.md for phase N. Run plans via szw-executor; spawn szw-verifier; write {phase}-{n}-SUMMARY.md, {phase}-VERIFICATION.md. Next: /szw-verify-work N or retry if gaps.
</process>
