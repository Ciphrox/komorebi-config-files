
# linux useful functions
# function touch {
#     param([string]$file)
#     if (Test-Path $file) {
#         # Update the timestamp if the file exists.
#         Set-ItemProperty -Path $file -Name LastWriteTime -Value (Get-Date)
#     } else {
#         # Create a new file if it doesn't exist.
#         New-Item -Path $file -ItemType File
#     }
# }

# Oh My Posh
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/sonicboom_dark.omp.json' | Invoke-Expression



# PSFzf
Import-Module PSFzf

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# Set-PsFzfOption -AltCCommand '$input | Invoke-Fzf | Set-Location'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PsFzfOption -TabExpansion
Set-PsFzfOption -TabCompletionPreviewWindow 'right|down|hidden'

# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Remove-Item Alias:cd
New-Alias -Name cd -Value z

Remove-Item Alias:ls
function pwshconf { nvim $profile }
function updatepwsh { . $profile }

function ls { eza --icons $args }
function la {ls -la}

function kimi { ollama run "kimi-k2:1t-cloud" $args}

function tree {
param(
  [string[]]$Args
)
  eza --tree --icons=always --git-ignore -I ".git|node_modules|dist|build|pycache|.log|.tmp|target" -L 5 @Args
} 

# Fastfetch
New-Alias -Name ff -Value fastfetch









ff
