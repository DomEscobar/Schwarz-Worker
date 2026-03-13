param(
  [string]$LabRelativePath = ".test-lab/schwarzworker-lab",
  [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$seedPath = Join-Path $PSScriptRoot "lab-seed"
$labPath = Join-Path $repoRoot $LabRelativePath
$labRoot = Split-Path -Parent $labPath
$stateFile = Join-Path $labRoot "lab-state.json"

if (-not (Test-Path $seedPath)) {
  throw "Seed path not found: $seedPath"
}

if ((Test-Path $labPath) -and -not $Force) {
  throw "Lab already exists at '$labPath'. Use -Force to recreate."
}

if (Test-Path $labPath) {
  Remove-Item -LiteralPath $labPath -Recurse -Force
}

if (-not (Test-Path $labRoot)) {
  New-Item -ItemType Directory -Path $labRoot | Out-Null
}

New-Item -ItemType Directory -Path $labPath | Out-Null
Copy-Item -Path (Join-Path $seedPath "*") -Destination $labPath -Recurse -Force

Push-Location $labPath
try {
  git init | Out-Null
  git add .
  git -c user.name=szw-lab -c user.email=szw-lab@example.local commit -m "chore: seed reusable schwarzworker lab" | Out-Null
  $seedCommit = (git rev-parse HEAD).Trim()
}
finally {
  Pop-Location
}

$state = [ordered]@{
  labPath = $labPath
  seedCommit = $seedCommit
  createdAt = (Get-Date).ToString("o")
}

$state | ConvertTo-Json | Set-Content -Path $stateFile -Encoding utf8

Write-Host "Lab created at: $labPath"
Write-Host "Seed commit: $seedCommit"
Write-Host "State file: $stateFile"
Write-Host ""
Write-Host "Next:"
Write-Host "  1) .\testing\start-cycle.ps1"
Write-Host "  2) Open OpenCode in the lab path and run /szw-* flows"
