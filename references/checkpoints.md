# Checkpoints

Golden rules for SchwarzWorker automation.

- **One task, one commit.** Each plan execution ends with an atomic git commit so history is traceable and revertible.
- **Do not trust SUMMARY alone.** The verifier checks the codebase; SUMMARY documents what was intended.
- **Goal-backward verification.** Verifier starts from the phase goal and must-haves, then checks existence, substance, and wiring in code.
- **Boundary Map is a contract.** Plans and verification must respect ROADMAP boundary contracts (produces/consumes between phases).
- **Summaries are context contracts.** Each SUMMARY must include provides/requires/affects, key decisions, fragile areas, and diagnostics for downstream work.
- **Decisions are append-only.** Record architectural/pattern/library decisions in `.planning/DECISIONS.md`; do not rewrite history.
- **Reassess after each phase.** If new facts invalidate remaining plans, write reassessment and adjust roadmap/requirements before continuing.
- **.planning/ is source of truth.** ROADMAP, REQUIREMENTS, phase PLAN/SUMMARY/VERIFICATION/UAT define what was planned and what was done. Keep them updated and committed when planning.commit_docs is true.
- **Human UAT for "done".** Phase is fully done only after verify-work (manual acceptance). Automated verification is a gate, not a substitute.
