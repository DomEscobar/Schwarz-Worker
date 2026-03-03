<purpose>
Capture implementation decisions for phase N before planning. Analyze the phase goal (from ROADMAP), identify gray areas (UI, API, content, organization), and ask the user until decisions are locked. Produces {phase}-CONTEXT.md. Standalone.
</purpose>

<process>

## 1. Resolve phase N

Get N from arguments. Load ROADMAP.md and find phase N (goal, optional success_criteria). Resolve phase directory .planning/phases/{phase}/ (e.g. 01-auth).

## 2. Identify gray areas

From the phase goal and type of work (visual, API, content, organization), list open decisions: layout, response format, structure, grouping, naming, error handling, etc.

## 3. Elicit decisions

For each gray area, ask the user until satisfied. Persist answers in STATE.md if useful.

## 4. Write CONTEXT

Write .planning/phases/{phase}/{phase}-CONTEXT.md using template context.md. This file is the contract for the researcher and planner: what is decided, what to investigate, what to implement.

## 5. Confirm

Next step: /szw-plan-phase N or /szw-phase N.

</process>

<dependencies>
Templates: context. Planning structure: ROADMAP, phases/.
</dependencies>
