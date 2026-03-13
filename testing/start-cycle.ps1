param(
  [string]$LabRelativePath = ".test-lab/schwarzworker-lab"
)

$ErrorActionPreference = "Stop"

$scriptRoot = $PSScriptRoot
$repoRoot = (Resolve-Path (Join-Path $scriptRoot "..")).Path
$labPath = Join-Path $repoRoot $LabRelativePath
$checklistPath = Join-Path $scriptRoot "broad-test-checklist.md"

if (-not (Test-Path $labPath)) {
  Write-Host "Lab not found. Creating it first..."
  & (Join-Path $scriptRoot "new-lab.ps1") -LabRelativePath $LabRelativePath
}

& (Join-Path $scriptRoot "reset-lab.ps1") -LabRelativePath $LabRelativePath -NewRunBranch

Write-Host ""
Write-Host "Cycle ready."
Write-Host "Lab path: $labPath"
Write-Host "Checklist: $checklistPath"
Write-Host ""
Write-Host "Recommended next steps:"
Write-Host "  1) Open OpenCode in: $labPath"
Write-Host "  2) Run /szw-new-project then /szw-phase 1..."
Write-Host "  3) Use checklist: testing/broad-test-checklist.md"
Write-Host "  4) Archive before reset: .\testing\archive-lab-run.ps1"
