---
name: szw-phase
description: Fused phase flow — plan, execute, reassess, then verify for one phase
argument-hint: "<N> [--no-verify-work]"
allowed-tools:
  - read
  - write
  - bash
  - grep
  - glob
  - task
---
<objective>
Run the full phase flow for phase N in one command: plan phase N, execute phase N (with internal retry loop until phase verification passes or max retries), reassess downstream plan validity, then run verify-work for phase N unless --no-verify-work is set. Uses only SchwarzWorker workflows and agents.
</objective>

<execution_context>
@workflows/phase-flow.md
</execution_context>

<context>
- **N** — Phase number (e.g. 1, 2, 3). Required.
- **--no-verify-work** — Optional. Skip manual UAT; only plan + execute (and internal verification loop).
- Planning state: .planning/ROADMAP.md, .planning/phases/ per docs/PLANNING-STRUCTURE.md.
</context>

<process>
Execute the phase-flow workflow from @workflows/phase-flow.md for the given phase N.

1. Resolve N from arguments; validate .planning/ and ROADMAP.
2. Run plan-phase for N (workflow plan-phase).
3. Run execute-phase for N; if verifier reports gaps, retry up to 3 times, then proceed or surface failure.
4. Run reassess-phase for N; if verdict is modified, replan affected downstream phases before continuing.
5. Unless --no-verify-work, run verify-work for N.
6. Report result and suggest next step (/szw-phase N+1 or /szw-audit-milestone).
</process>
