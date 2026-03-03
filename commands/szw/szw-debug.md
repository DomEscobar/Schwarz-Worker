---
name: szw-debug
description: Systematic debugging with persistent state.
argument-hint: "[desc]"
allowed-tools:
  - read
  - write
  - bash
  - grep
  - glob
  - task
---
<objective>
Diagnose an issue: spawn szw-debugger with description and codebase context; produce hypothesis and fix plan. Standalone.
</objective>

<execution_context>
Spawn szw-debugger agent with problem description and relevant files. Debugger: reproduce, hypothesize, test, report. Optionally write .planning/debug-state or fix plan for execute-phase.
</execution_context>

<process>
Load problem from arguments or prompt. Spawn szw-debugger. Collect report and fix plan. Suggest /szw-execute-phase N with fix plan if applicable.
</process>
