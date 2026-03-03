<purpose>
Archive the current milestone: move phase directories to .planning/milestones/v{version}-phases/, create milestone archive doc, optionally tag release in git. Standalone.
</purpose>

<process>

## 1. Resolve milestone version

From ROADMAP or argument. Ensure audit has been run and passed (or user confirms override).

## 2. Archive phase directories

Move .planning/phases/* to .planning/milestones/v{version}-phases/ (or copy and then remove from phases/). Preserve all PLAN, SUMMARY, VERIFICATION, UAT, CONTEXT, RESEARCH.

## 3. Archive milestone doc

Write .planning/milestones/v{version}-archive.md (or similar) with: version, date, requirement count, phase count, link to audit report.

## 4. Git tag (optional)

If planning.commit_docs and git available: create tag e.g. v{version} at current HEAD. Document in STATE or archive.

## 5. Clear or prepare for next milestone

Phases directory empty or prepared for next milestone. User runs /szw-new-milestone to start next version.

</process>
