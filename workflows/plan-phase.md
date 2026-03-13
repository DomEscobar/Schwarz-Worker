<purpose>
Plan phase N: load context and goal, optionally research, produce atomic task plans, verify plans against goal and boundary contracts until they pass. Output: {phase}-RESEARCH.md, {phase}-{n}-PLAN.md. Standalone.
</purpose>

<process>

## 1. Resolve phase N and load context

Get N from arguments. Load ROADMAP (phase goal, success_criteria, Boundary Map contracts for this phase), .planning/phases/{phase}/{phase}-CONTEXT.md, REQUIREMENTS.md (requirements assigned to this phase), DECISIONS.md.
Load relevant skills from configured `skills.paths` (if present), especially boundary-contract and domain skills for this phase.

## 2. Optional research

If workflow.research enabled: spawn szw-phase-researcher to investigate how to implement this phase given CONTEXT and boundary contracts. Write .planning/phases/{phase}/{phase}-RESEARCH.md using the research template (summary, don't-hand-roll table, pitfalls, warning signs).

## 3. Produce plans

Spawn szw-planner with: phase goal, CONTEXT, RESEARCH, REQUIREMENTS for this phase, boundary contracts, and relevant upstream summaries.
Planner produces one or more atomic plans. Each plan: structured (e.g. XML or template plan.md) with task name, files, action, verify, done, and must_haves aligned to boundary contracts.
Plans must be small enough for one execution context.
Write .planning/phases/{phase}/{phase}-01-PLAN.md, {phase}-02-PLAN.md, ...

When injecting upstream summaries:
- start with highest-level summary available
- drill down only if needed
- keep total injected summary context within config token budget
- drop oldest/least-relevant summaries first when over budget

## 4. Plan check loop

Spawn szw-plan-checker to verify plans achieve phase goal, must-haves, and boundary contracts.
If checker rejects: feed back to planner, revise plans, repeat until pass or max iterations.

## 5. Persist

Ensure all PLAN files are written. Next step: /szw-execute-phase N or /szw-phase N.

</process>

<dependencies>
Agents: szw-planner, szw-plan-checker; optionally szw-phase-researcher. Templates: plan, research. References: verification-patterns for must-haves, checkpoints for boundary-map contract rules.
</dependencies>
