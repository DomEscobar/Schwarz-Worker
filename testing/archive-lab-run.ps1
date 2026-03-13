param(
  [string]$LabRelativePath = ".test-lab/schwarzworker-lab"
)

$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$labPath = Join-Path $repoRoot $LabRelativePath
$labRoot = Split-Path -Parent $labPath
$archiveRoot = Join-Path $labRoot "archives"
$runId = Get-Date -Format "yyyyMMdd-HHmmss"
$archivePath = Join-Path $archiveRoot $runId

if (-not (Test-Path $labPath)) {
  throw "Lab path not found: $labPath. Run .\testing\new-lab.ps1 first."
}

New-Item -ItemType Directory -Path $archivePath -Force | Out-Null

Push-Location $labPath
try {
  $status = git status --short
  $log = git log --oneline -n 30
  $branch = (git rev-parse --abbrev-ref HEAD).Trim()

  $notes = @(
    "Run archived at: " + (Get-Date).ToString("o")
    "Branch: $branch"
    ""
    "## git status --short"
    $status
    ""
    "## git log --oneline -n 30"
    $log
  )
  $notes | Set-Content -Path (Join-Path $archivePath "run-notes.md") -Encoding utf8

  if (Test-Path ".planning") {
    Copy-Item -Path ".planning" -Destination (Join-Path $archivePath ".planning") -Recurse -Force
  }
}
finally {
  Pop-Location
}

Write-Host "Archived run to: $archivePath"
