# Spec Kit vs SchwarzWorker

Comparison of [GitHub Spec Kit](https://github.com/github/spec-kit) and SchwarzWorker (szw-*) as spec-driven development approaches.

## Summary

| Aspect | **GitHub Spec Kit** | **SchwarzWorker (szw-*)** |
|--------|---------------------|----------------------------|
| **What “spec-driven” means** | Specs are **executable** — they drive **generation** of code (what/why → plan → tasks → implement). | Specs **govern** the process: requirements, plans, DOD, KPIs define what gets done and how it’s verified; the agent works **to** those specs. |
| **Unit of work** | **Feature** (e.g. `001-create-taskify`): one spec per feature, then plan → tasks → implement. | **Phase** within a **milestone**: roadmap with phases, one flow per phase (plan → execute → verify). |
| **Governance** | **Constitution** (principles), optional clarify / analyze / checklist. | **KPIs**, **responsibility contracts**, **definition of done**, **ownership model**, **milestone audit** — stronger accountability and metrics. |
| **Delivery** | **CLI** (`specify init` with `uv`), installs templates/scripts and adds `/speckit.*` commands to your agent. | **Markdown-only**: copy/link into OpenCode; no CLI — commands, workflows, agents, templates are all markdown. |
| **Lifecycle** | Single-feature flow: specify → plan → tasks → implement (with optional refinement). | **Full project lifecycle**: new project, map codebase, milestones, phases, audit, complete milestone, pause/resume, handoff. |
| **Host** | Any supported AI agent (Cursor, Claude Code, Copilot, etc.). | OpenCode (or any host that runs slash commands from markdown specs). |

## One-line distinction

- **Spec Kit**: Spec-to-implementation toolkit — specs drive **what gets built** for one feature.
- **SchwarzWorker**: Spec-governed autonomous development — specs drive **how work is planned, executed, verified, and audited** across milestones and phases, with KPIs and ownership.

## When to use which

- **Spec Kit**: Greenfield or single-feature work; you want a repeatable “idea → spec → plan → tasks → code” pipeline with minimal process.
- **SchwarzWorker**: Multi-phase projects, brownfield, or when you need accountability (KPIs, DOD, ownership, milestone audits) and a full project/milestone/phase lifecycle.
