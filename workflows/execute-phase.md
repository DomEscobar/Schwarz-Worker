<purpose>
Execute all plans for phase N: run each plan in a fresh context (waves, parallel where independent), commit per task, then run phase verification. Produces {phase}-{n}-SUMMARY.md and {phase}-VERIFICATION.md. Standalone.
</purpose>

<process>

## 1. Resolve phase N and list plans

Get N from arguments. List .planning/phases/{phase}/*-PLAN.md. Determine execution order (dependencies if any); group into waves for parallel execution.

## 2. Execute plans

For each plan file, spawn szw-executor with the plan content and project context (AGENTS.md, codebase). Executor implements the task, runs verify/done checks, writes SUMMARY for that plan. After each plan: atomic git commit (e.g. feat(phase): description). Use references/checkpoints.md and git-integration if present.

## 3. Phase verification

Spawn szw-verifier with: phase goal, ROADMAP success_criteria, must-haves from plans (truths, artifacts, key_links). Verifier checks codebase (existence, substantive, wired per references/verification-patterns.md), writes .planning/phases/{phase}/{phase}-VERIFICATION.md with status (passed/gaps_found) and gaps.

## 4. If gaps_found

Return verification report to caller (phase-flow may retry execute-phase with fix plans). Do not overwrite SUMMARYs; add fix plans or re-run in next iteration.

## 5. Report

Summarize: plans executed, verification status. Next: /szw-verify-work N (manual UAT) or continue fused flow.

</process>

<dependencies>
Agents: szw-executor, szw-verifier. References: verification-patterns, checkpoints, git-integration. Templates: summary, verification.
</dependencies>
