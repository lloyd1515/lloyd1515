# verify-readme.ps1
# TDD script for lloyd1515/README.md refactor

$readmePath = "..\README.md"
$content = Get-Content $readmePath -Raw

$success = $true

# Assertion 1: NOT matches "WAVS" | "OmX" | "Oh My codeX"
if ($content -match "WAVS" -or $content -match "OmX" -or $content -match "Oh My codeX") {
    Write-Error "Assertion Failed: Noise projects (WAVS/OmX) still present in README."
    $success = $false
}

# Assertion 2: NOT matches "Course Project"
if ($content -match "Course Project") {
    Write-Error "Assertion Failed: Generic 'Course Project' descriptor still present."
    $success = $false
}

# Assertion 3: MATCHES "300x" AND "500 MB/s"
if ($content -notmatch "300x" -or $content -notmatch "500 MB/s") {
    Write-Error "Assertion Failed: High-signal technical metrics (300x, 500 MB/s) missing."
    $success = $false
}

# Assertion 4: MATCHES "Skill Matrix"
if ($content -notmatch "Skill Matrix") {
    Write-Error "Assertion Failed: Skill Matrix section missing."
    $success = $false
}

if ($success) {
    Write-Host "README Verification: PASSED" -ForegroundColor Green
    exit 0
} else {
    Write-Host "README Verification: FAILED" -ForegroundColor Red
    exit 1
}
