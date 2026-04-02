# verify-readme-v3.ps1
# TDD script for lloyd1515/README.md refactor Iteration 3

$readmePath = "..\README.md"
$content = Get-Content $readmePath -Raw

$success = $true

$assertions = @(
    "Computer Science Student",
    "Expected Graduation: 2027",
    "300x",
    "500 MB/s",
    "Typing SVG",
    "LinkedIn Badge",
    "style=for-the-badge",
    "#gh-dark-mode-only",
    "#gh-light-mode-only"
)

foreach ($assertion in $assertions) {
    if ($content -notmatch [regex]::Escape($assertion)) {
        Write-Error "Assertion Failed: Missing '$assertion'"
        $success = $false
    }
}

if ($success) {
    Write-Host "README Verification: PASSED" -ForegroundColor Green
    exit 0
} else {
    Write-Host "README Verification: FAILED" -ForegroundColor Red
    exit 1
}
