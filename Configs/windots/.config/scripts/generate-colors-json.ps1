$WallpaperPath = Get-ItemPropertyValue -Path 'HKCU:\Control Panel\Desktop' -Name 'Wallpaper'

matugen image $WallpaperPath -j hex > "$env:USERPROFILE/.config/matugen/colors.json"