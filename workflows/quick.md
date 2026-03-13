<purpose>
Execute an ad-hoc task without full phase flow: one-shot plan + execute, no discuss-phase, no verify-work. Plans and summaries live under .planning/quick/. Standalone.
</purpose>

<process>

## 1. Elicit task

Ask user: What do you want to do? (e.g. "Add dark mode toggle", "Fix login validation"). Short description.

## 2. Plan

Spawn szw-planner with the task description and current codebase context. Produce a single PLAN (or minimal set). Write .planning/quick/{id}-{slug}/PLAN.md.

## 3. Execute

Spawn szw-executor with the plan. Execute, atomic commit.
Write SUMMARY.md in same quick directory using the rich summary contract fields (provides, key files, diagnostics, blocker_discovered).

## 4. Report

Summarize what was done. No phase verification or UAT. For full traceability use /szw-phase N instead.

</process>

<dependencies>
Agents: szw-planner, szw-executor.
</dependencies>
