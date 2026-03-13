---
name: szw-record-decision
description: Append a new row to .planning/DECISIONS.md (append-only).
allowed-tools:
  - read
  - write
  - glob
---
<objective>
Record one explicit decision in the project's append-only decision register so future planning and execution use consistent assumptions.
</objective>

<execution_context>
@workflows/record-decision.md
</execution_context>

<process>
Execute @workflows/record-decision.md. Append a new decision row and report the generated decision ID.
</process>
