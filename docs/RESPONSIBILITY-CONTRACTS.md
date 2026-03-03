# Responsibility Contracts

Each role has a clear contract: what they are accountable for, what constitutes failure, and what happens next.

## Milestone Owner (Human or Orchestrator)

- **Accountable for:** Final milestone DOD; ensuring audit is run and KPIs meet thresholds before marking complete.
- **Failure:** Marking milestone complete when audit status is `gaps_found` or KPI targets are not met.
- **Next:** Do not run `/szw-complete-milestone` until audit is `passed` and KPIs satisfy thresholds; fix gaps and re-audit.

## Planner (szw-planner)

- **Accountable for:** Plans that, if executed correctly, achieve the phase goal; plans include verifiable must-haves (truths, artifacts, key_links).
- **Failure:** Plans that omit required artifacts or wiring; plans that cannot be verified.
- **Next:** Plan-checker rejects; planner must revise until plans pass checker.

## Plan Checker (szw-plan-checker)

- **Accountable for:** Rejecting plans that do not satisfy phase goal and must-haves.
- **Failure:** Approving plans that miss must-haves or are not verifiable.
- **Next:** Loop back to planner; do not proceed to execute until approved.

## Executor (szw-executor)

- **Accountable for:** Implementing the plan as specified; producing SUMMARY that reflects what was actually done.
- **Failure:** Leaving stubs, placeholders, or unwired artifacts when plan required real implementation.
- **Next:** Verifier marks gaps; execute-phase can re-run with fix plans (loop).

## Verifier (szw-verifier)

- **Accountable for:** Correctly classifying phase as passed vs gaps_found; reporting gaps with evidence (missing, stub, unwired).
- **Failure:** False pass (marking passed when critical gaps exist); false fail (marking gaps when goal is achieved).
- **Next:** If false pass, milestone audit or UAT will find issues; re-verify. If false fail, human or executor can appeal (re-run verification with clarified must-haves).

## Integration Checker (szw-integration-checker)

- **Accountable for:** Reporting cross-phase wiring and E2E flow gaps.
- **Failure:** Missing integration gaps that cause milestone DOD to fail.
- **Next:** Gaps appear in milestone audit; owner must address before complete.

## Human (Developer)

- **Accountable for:** UAT (verify-work): confirming features work as expected; not marking phase/milestone done without verification.
- **Failure:** Signing off without testing or ignoring known gaps.
- **Next:** Fix issues before complete; use debug/execute flow for fixes.

---

Contracts are used to assign blame only when needed; the main purpose is to make expectations explicit so the system can be tuned (prompts, workflows) to meet them.
