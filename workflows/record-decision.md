<purpose>
Append a new architectural/pattern/library/scope decision to `.planning/DECISIONS.md` using the append-only register format. Standalone.
</purpose>

<process>
Read `.planning/DECISIONS.md` (or create from templates/decisions.md if missing).
Collect required fields: scope, decision, choice, rationale, revisable trigger, and when (phase/milestone context).
Compute next sequential ID (`D001`, `D002`, ...), append a new row, and do not edit historical rows.
Confirm the new decision ID to the user.
</process>

<dependencies>
Template: decisions.
</dependencies>
