<purpose>
Manual user acceptance testing for phase N: extract testable deliverables from the phase, walk the user through each, record pass/fail or issues, optionally spawn debug and produce fix plans. Produces {phase}-UAT.md. Standalone.
</purpose>

<process>

## 1. Resolve phase N and load deliverables

Get N from arguments. Load phase goal, VERIFICATION.md, SUMMARYs, ROADMAP success criteria, and boundary contracts.
Extract testable deliverables (what the user should be able to do now), prioritizing items marked as must-haves and boundary-linked flows.

## 2. Walk through each deliverable

For each deliverable, ask the user: Can you do X? Yes / No / Describe issue. Record in UAT.

## 3. If issues

For each failure: optionally spawn szw-debugger to diagnose and produce fix plan. Append to UAT or write to phase directory. User can run /szw-execute-phase N again with fix plans.

## 4. Write UAT

Write .planning/phases/{phase}/{phase}-UAT.md using template uat.md. Status: passed / issues_found.

## 5. Report

If passed: phase is done. Next: /szw-phase N+1 or /szw-audit-milestone. If issues: suggest re-run execute-phase with fix plans.

</process>

<dependencies>
Agent: szw-debugger (optional). Template: uat.
</dependencies>
