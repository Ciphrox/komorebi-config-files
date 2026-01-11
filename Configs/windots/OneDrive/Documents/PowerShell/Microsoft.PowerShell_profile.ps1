
# linux useful functions
function touch {
    param([string]$file)
    if (Test-Path $file) {
        # Update the timestamp if the file exists.
        Set-ItemProperty -Path $file -Name LastWriteTime -Value (Get-Date)
    } else {
        # Create a new file if it doesn't exist.
        New-Item -Path $file -ItemType File
    }
}

# Oh My Posh
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/sonicboom_dark.omp.json' | Invoke-Expression


# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Remove-Item Alias:cd
New-Alias -Name cd -Value z


# Fastfetch
New-Alias -Name ff -Value fastfetch
ff