---
name: szw-verify-work
description: Manual UAT for phase N.
argument-hint: "<N>"
allowed-tools:
  - read
  - write
  - grep
  - glob
  - task
---
<objective>
User acceptance testing for phase N: walk through deliverables, record pass/fail, optionally spawn debug for fix plans. Writes UAT.md. Standalone.
</objective>

<execution_context>
@workflows/verify-work.md
</execution_context>

<process>
Execute the verify-work workflow from @workflows/verify-work.md for phase N. Extract deliverables; walk user through each; write {phase}-UAT.md. Next: /szw-phase N+1 or /szw-audit-milestone.
</process>
