# Checkpoints

Golden rules for SchwarzWorker automation.

- **One task, one commit.** Each plan execution ends with an atomic git commit so history is traceable and revertible.
- **Do not trust SUMMARY alone.** The verifier checks the codebase; SUMMARY documents what was intended.
- **Goal-backward verification.** Verifier starts from the phase goal and must-haves, then checks existence, substance, and wiring in code.
- **.planning/ is source of truth.** ROADMAP, REQUIREMENTS, phase PLAN/SUMMARY/VERIFICATION/UAT define what was planned and what was done. Keep them updated and committed when planning.commit_docs is true.
- **Human UAT for "done".** Phase is fully done only after verify-work (manual acceptance). Automated verification is a gate, not a substitute.
