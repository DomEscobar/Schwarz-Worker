# Broad Test Checklist

Use this checklist for each recurring cycle in the resettable lab.

## 0. Setup

- [ ] `new-lab.ps1` has been run at least once
- [ ] `start-cycle.ps1` created a fresh run branch
- [ ] Lab repo is clean before starting (`git status`)

## 1. Command Wiring

- [ ] `/szw-help` lists `/szw-reassess-phase` and `/szw-record-decision`
- [ ] `/szw-settings` exposes reassessment, blocking UAT, context injection, skills paths
- [ ] `/szw-new-project` creates `.planning/DECISIONS.md`

## 2. Happy Path

- [ ] `/szw-discuss-phase 1` writes `01-CONTEXT.md`
- [ ] `/szw-record-decision` appends a decision row
- [ ] `/szw-plan-phase 1` produces boundary-aware plans
- [ ] `/szw-execute-phase 1` writes rich summary frontmatter/sections
- [ ] `/szw-reassess-phase 1` writes `01-REASSESSMENT.md`
- [ ] `/szw-verify-work 1` enforces UAT gate behavior

## 3. Failure Injection

- [ ] Stub artifact detected by verifier as gap
- [ ] Boundary contract mismatch detected
- [ ] Blocker-discovered path triggers replan recommendation
- [ ] Failing UAT prevents done status (when blocking enabled)

## 4. Continuity and Undo

- [ ] `/szw-pause-work` writes continue context when mid-plan
- [ ] `/szw-resume-work` restores exact next action
- [ ] Revert one task commit and re-run execute/verify successfully

## 5. Milestone Audit

- [ ] `/szw-audit-milestone` reports coverage + integration correctly
- [ ] KPI and DOD gates behave correctly

## 6. Archive

- [ ] `archive-lab-run.ps1` produced a timestamped archive
- [ ] Archive includes `.planning`, git status/log, and notes
- [ ] Repo reset ready for next cycle
