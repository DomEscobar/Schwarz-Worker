# Changelog

All notable changes to SchwarzWorker (szw-*).

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.2.0] - 2026-03-03

### Changed

- **Standalone project.** No dependency on GSD-OpenCode or any other framework. All commands, workflows, agents, references, and templates are part of SchwarzWorker.
- Planning structure (`.planning/`) is defined and owned by SchwarzWorker (docs/PLANNING-STRUCTURE.md).
- All workflows reference szw- agents and @workflows/ or @references/ or @templates/ only.

### Added

- **npm installer:** `npx schwarz-worker` for one-command install. Prompts for global or local; supports `--global`/`--local`, `--force`, `--check`. See INSTALL.md.
- **package.json** with bin `schwarz-worker` and `files` for publish.
- **bin/install.js** — copies commands, workflows, agents, references, templates, docs to OpenCode config dir; writes VERSION.
- **VERSION** file; **.gitignore** for `.opencode` and `node_modules`.
- **Commands:** szw-new-project, szw-map-codebase, szw-discuss-phase, szw-plan-phase, szw-execute-phase, szw-verify-work, szw-phase, szw-audit-milestone, szw-complete-milestone, szw-new-milestone, szw-progress, szw-help, szw-quick, szw-add-phase, szw-insert-phase, szw-remove-phase, szw-pause-work, szw-resume-work, szw-debug, szw-settings.
- **Workflows:** new-project, map-codebase, discuss-phase, plan-phase, execute-phase, verify-work, phase-flow, audit-milestone, complete-milestone, new-milestone, progress, quick, add-phase, insert-phase, remove-phase, pause-work, resume-work, settings.
- **Agents:** szw-planner, szw-plan-checker, szw-executor, szw-verifier, szw-integration-checker, szw-codebase-mapper, szw-phase-researcher, szw-project-researcher, szw-research-synthesizer, szw-roadmapper, szw-debugger.
- **References:** verification-patterns.md, planning-config.md, checkpoints.md.
- **Templates:** project, requirements, roadmap, state, context, plan, summary, verification, uat.
- **Docs:** PLANNING-STRUCTURE.md (new); KPIs, contracts, DOD, ownership unchanged in content but now refer to szw- only.

## [0.1.0] - 2026-03-03

### Added

- Initial SchwarzWorker layer (KPI-aware, responsibility contracts, quantified DOD, ownership, fused phase flow). Previously depended on GSD-OpenCode; see 0.2.0 for standalone release.
