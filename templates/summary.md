# Summary {{phase}}-{{n}}

---
id: {{phase}}-{{n}}
phase: {{phase}}
milestone: {{milestone}}
plan_file: {{plan_file}}
commit_ref: {{commit_ref}}
provides:
  - {{what_this_plan_provides}}
requires:
  - phase: {{upstream_phase_or_none}}
    provides: {{what_was_consumed}}
affects:
  - {{downstream_phase_or_none}}
key_files:
  - {{path_to_key_file}}
key_decisions:
  - {{decision_and_why}}
patterns_established:
  - {{pattern_name_and_location}}
observability_surfaces:
  - {{where_to_check_health_or_behavior_or_none}}
requirements_completed:
  - {{req_id_or_none}}
verification_result: {{passed_or_failed}}
duration: {{duration}}
completed_at: {{iso_timestamp}}
blocker_discovered: false
---

**Plan:** `{{plan_file}}`
**Commit:** `{{commit_ref}}`

## What was done
- ...

## Verification
- Observable truths checked: ...
- Artifacts checked: ...
- Key links checked: ...

## Deviations
- ...

## Known limitations
- ...

## Forward intelligence

### What the next phase should know
- ...

### What's fragile
- ...

### Authoritative diagnostics
- ...

### What assumptions changed
- ...

## Changes
- `path/to/file` — ...
- `path/to/file` — ...

---

*Written by szw-executor after each plan execution. This summary is a downstream context contract, not just a completion receipt.*
