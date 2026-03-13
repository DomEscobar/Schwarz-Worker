<purpose>
After phase N execution, reassess downstream roadmap/requirements validity using verification results, summaries, and new decisions. Produces {phase}-REASSESSMENT.md and optional roadmap/requirements updates. Standalone.
</purpose>

<process>

## 1. Resolve phase N and load evidence

Get N from arguments. Read:
- .planning/ROADMAP.md (including Boundary Map)
- .planning/REQUIREMENTS.md
- .planning/DECISIONS.md (if present)
- .planning/phases/{phase}/{phase}-VERIFICATION.md
- .planning/phases/{phase}/*-SUMMARY.md

## 2. Detect plan drift

Check for drift indicators:
- SUMMARY has `blocker_discovered: true`
- verification gaps imply downstream assumptions are invalid
- produced artifacts differ from boundary contract expectations
- requirements were partially met and need re-scoping

## 3. Decide verdict

Set verdict:
- `no-change` if roadmap order/contracts remain valid
- `modified` if phase outcomes require roadmap, boundary map, or requirement updates

## 4. Apply updates (only when modified)

If modified:
- update ROADMAP boundary contracts and/or downstream phase goals
- update REQUIREMENTS phase assignment/status/evidence where needed
- append decision entries in DECISIONS.md for major shifts

## 5. Write reassessment

Write `.planning/phases/{phase}/{phase}-REASSESSMENT.md` using template reassessment.md.
Include:
- changes made
- requirement coverage impact
- decision references
- next action

## 6. Report

Return verdict and concrete follow-up:
- no-change -> continue normal flow
- modified -> rerun plan for affected phases before execution

</process>

<dependencies>
Template: reassessment. References: checkpoints, verification-patterns.
</dependencies>
