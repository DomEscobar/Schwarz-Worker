<purpose>
Insert a new phase before phase N; renumber subsequent phases in ROADMAP and REQUIREMENTS. Standalone.
</purpose>

<process>
Get N from arguments. Read ROADMAP.md and REQUIREMENTS.md.
Insert new phase as N, renumber N, N+1, ... in ROADMAP and in phase assignments in REQUIREMENTS.
Update Boundary Map contracts for affected boundaries (N-1->N, N->N+1, and any shifted references).
Rename .planning/phases/ directories if they exist (e.g. 02-* -> 03-*).
Write updated ROADMAP and REQUIREMENTS. Confirm.
</process>
