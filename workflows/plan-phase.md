<purpose>
Plan phase N: load context and goal, optionally research, produce atomic task plans, verify plans against goal until they pass. Output: {phase}-RESEARCH.md, {phase}-{n}-PLAN.md. Standalone.
</purpose>

<process>

## 1. Resolve phase N and load context

Get N from arguments. Load ROADMAP (phase goal, success_criteria), .planning/phases/{phase}/{phase}-CONTEXT.md, REQUIREMENTS.md (requirements assigned to this phase).

## 2. Optional research

If workflow.research enabled: spawn szw-phase-researcher to investigate how to implement this phase given CONTEXT. Write .planning/phases/{phase}/{phase}-RESEARCH.md.

## 3. Produce plans

Spawn szw-planner with: phase goal, CONTEXT, RESEARCH, REQUIREMENTS for this phase. Planner produces one or more atomic plans. Each plan: structured (e.g. XML or template plan.md) with task name, files, action, verify, done. Plans small enough for one execution context (e.g. 200k tokens). Write .planning/phases/{phase}/{phase}-01-PLAN.md, {phase}-02-PLAN.md, ...

## 4. Plan check loop

Spawn szw-plan-checker to verify plans achieve phase goal and must-haves. If checker rejects: feed back to planner, revise plans, repeat until pass or max iterations.

## 5. Persist

Ensure all PLAN files are written. Next step: /szw-execute-phase N or /szw-phase N.

</process>

<dependencies>
Agents: szw-planner, szw-plan-checker; optionally szw-phase-researcher. Templates: plan. References: verification-patterns for must-haves.
</dependencies>
