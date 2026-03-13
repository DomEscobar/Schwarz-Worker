# Reusable Test Lab

This folder provides a recurring, resettable test environment for SchwarzWorker.

## What you get

- A seed app in `testing/lab-seed/`
- Scripts to create/reset/archive a disposable lab repo under `.test-lab/`
- A broad test checklist for repeated evaluations

## Quick start (PowerShell)

```powershell
# 1) Create or recreate the lab
.\testing\new-lab.ps1 -Force

# 2) Start a fresh cycle (reset + new run branch)
.\testing\start-cycle.ps1

# 3) Execute your broad tests in the lab repo
#    (run OpenCode inside .test-lab\schwarzworker-lab)

# 4) Archive artifacts before resetting
.\testing\archive-lab-run.ps1

# 5) Reset for the next cycle
.\testing\reset-lab.ps1
```

## Lab path

Default lab repo path: `.test-lab/schwarzworker-lab`

You can override it with `-LabRelativePath` in scripts.

## Safety

Scripts only run against paths containing `.test-lab` to avoid accidental destructive operations outside the test harness.
