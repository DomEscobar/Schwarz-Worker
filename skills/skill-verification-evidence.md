# Skill: Verification Evidence

Use this skill when writing VERIFICATION.md, SUMMARY.md, or milestone audits.

## Evidence ladder

1. Static evidence: files, exports, references, wiring.
2. Command evidence: test/build/lint output and exit status.
3. Behavioral evidence: runtime behavior, API response, UI flow.
4. Human evidence: UAT confirmation when automation cannot prove outcome.

## Rules

- Never mark `validated` without explicit evidence.
- Link evidence to requirement IDs and must-have items.
- Prefer direct evidence over narrative claims.
- If evidence conflicts, classify as `partial` or `unsatisfied`, not `validated`.
