$colorGeneratorPath = "$env:USERPROFILE/.config/scripts/generate-colors-json.ps1"
$colorsJsonPath = "$env:USERPROFILE/.config/matugen/colors.json"
$cssPath = "$env:USERPROFILE/.config/yasb/colors.css"

Write-Host "Generating Material You colors with matugen..."
# try {
#     & $colorGeneratorPath
#     Write-Host "Colors generated successfully."
# } catch {
#     Write-Host "Failed to generate colors: $_"
# }

if (!(Test-Path $colorsJsonPath)) {
    Write-Error "Colors JSON not found at: $colorsJsonPath"
    exit 1
}

$colorsData = Get-Content $colorsJsonPath | ConvertFrom-Json
$colors = $colorsData.colors

$cssContent = ":root {`n"

# Add system colors
$colors.PSObject.Properties | ForEach-Object {
    $name = $_.Name.Replace('_', '-')
    $value = $_.Value.default
    $cssContent += "  --md-sys-color-${name}: $value;`n"
}

$cssContent += "}"

$cssContent | Set-Content $cssPath -Encoding UTF8

Write-Host "YASB theme colors generated at: $cssPath" -ForegroundColor Green

taskkill /IM yasb.exe /F; yasb