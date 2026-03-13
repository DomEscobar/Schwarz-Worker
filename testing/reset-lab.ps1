param(
  [string]$LabRelativePath = ".test-lab/schwarzworker-lab",
  [switch]$NewRunBranch = $true
)

$ErrorActionPreference = "Stop"

function Assert-TestLabPath([string]$PathToCheck) {
  if ($PathToCheck -notmatch "[\\/]\.test-lab([\\/]|$)") {
    throw "Refusing to run destructive reset outside .test-lab path: $PathToCheck"
  }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$labPath = Join-Path $repoRoot $LabRelativePath
$labRoot = Split-Path -Parent $labPath
$stateFile = Join-Path $labRoot "lab-state.json"

Assert-TestLabPath -PathToCheck $labPath

if (-not (Test-Path $stateFile)) {
  throw "Lab state file not found: $stateFile. Run .\testing\new-lab.ps1 first."
}

if (-not (Test-Path $labPath)) {
  throw "Lab path not found: $labPath. Run .\testing\new-lab.ps1 first."
}

$state = Get-Content -Path $stateFile -Raw | ConvertFrom-Json
$seedCommit = $state.seedCommit

Push-Location $labPath
try {
  git reset --hard $seedCommit | Out-Null
  git clean -fdx | Out-Null

  if ($NewRunBranch) {
    $branch = "run-" + (Get-Date -Format "yyyyMMdd-HHmmss")
    git checkout -B $branch $seedCommit | Out-Null
    Write-Host "Created fresh run branch: $branch"
  }
}
finally {
  Pop-Location
}

Write-Host "Lab reset to seed commit: $seedCommit"
Write-Host "Lab path: $labPath"
