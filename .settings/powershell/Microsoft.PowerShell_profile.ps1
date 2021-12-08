## Powershell initialize script
<#
  .NOTE




#>
Set-StrictMode -version latest

# foor import library

$myLibsDir = $PSScriptRoot + '/libs'
. ($myLibsDir + '/commonUtils.ps1')



# prompt
# Invoke-Expression (&starship init powershell)
function prompt()
{
    $isAdmin = [myUserRole]::isAdmin()
    $prompt = $isAdmin ? " # " :  " > "
    $currentPath = (Split-Path (Get-Location) -Leaf)
    $currentDrive =(Convert-Path \).substring(0, 1)
    $userName =$env:USERNAME

    # Prompt return
    $currentDrive+": /" + $currentPath + $prompt
}

