$WallpaperPath = Get-ItemPropertyValue -Path 'HKCU:\Control Panel\Desktop' -Name 'Wallpaper'
$colorGeneratorPath = "$env:USERPROFILE/.config/scripts/generate-colors-json.ps1"
$colorsJsonPath = "$env:USERPROFILE/.config/matugen/colors.json"
$baseConfigPath = "$env:USERPROFILE/.config/komorebi/komorebi.base.json"
$finalConfigPath = "$env:USERPROFILE/.config/komorebi/komorebi.json"


Write-Host "Generating Material You colors with matugen..."
try {
    & $colorGeneratorPath
    Write-Host "Colors generated successfully."
} catch {
    Write-Host "Failed to generate colors: $_"
}

if (!(Test-Path $colorsJsonPath)) {
    Write-Error "Colors JSON not found at: $colorsJsonPath"
    exit 1
}

echo $colorsJsonPath
$colors = Get-Content $colorsJsonPath | ConvertFrom-Json

$baseConfig = Get-Content $baseConfigPath | Out-String
if (!(Test-Path $baseConfigPath)) {
    Write-Error "Base config not found at: $baseConfigPath"
    exit 1
}
$template = Get-Content $baseConfigPath -Raw

echo "Updating Komorebi configuration with new colors..."

$colorMappings = @{
    "{{BACKGROUND}}" = $colors.colors.surface.default
    "{{BACKGROUND_ELEVATED}}" = $colors.colors.surface_container.default
    "{{SURFACE_VARIANT}}" = $colors.colors.surface_variant.default
    "{{OUTLINE_VARIANT}}" = $colors.colors.outline_variant.default
    "{{OUTLINE}}" = $colors.colors.outline.default
    "{{ON_SURFACE_VARIANT}}" = $colors.colors.on_surface_variant.default
    "{{ON_SURFACE}}" = $colors.colors.on_surface.default
    "{{ON_BACKGROUND}}" = $colors.colors.on_surface.default
    "{{ERROR}}" = $colors.colors.error.default
    "{{SECONDARY}}" = $colors.colors.secondary.default
    "{{TERTIARY}}" = $colors.colors.tertiary.default
    "{{PRIMARY_CONTAINER}}" = $colors.colors.primary_container.default
    "{{SECONDARY_CONTAINER}}" = $colors.colors.secondary_container.default
    "{{PRIMARY}}" = $colors.colors.primary.default
    "{{TERTIARY_CONTAINER}}" = $colors.colors.tertiary_container.default
    "{{ERROR_CONTAINER}}" = $colors.colors.error_container.default
    "{{WALLPAPER_PATH}}" = $WallpaperPath.Replace('\', '/')
}


foreach ($placeholder in $colorMappings.Keys) {
    $template = $template.Replace($placeholder, $colorMappings[$placeholder])
}


$template | Set-Content $finalConfigPath -Encoding UTF8

Write-Host "Theme colors applied:"
Write-Host "  Primary: $($colorMappings['{{PRIMARY}}'])" -ForegroundColor Cyan
Write-Host "  Secondary: $($colorMappings['{{SECONDARY}}'])" -ForegroundColor Magenta
Write-Host "  Tertiary: $($colorMappings['{{TERTIARY}}'])" -ForegroundColor Yellow
Write-Host "  Surface: $($colorMappings['{{BACKGROUND}}'])" -ForegroundColor Gray

Write-Host "Wallpaper and Material You theme applied successfully!" -ForegroundColor Green
