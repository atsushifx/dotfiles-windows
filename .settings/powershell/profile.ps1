<#
  .SYNOPSIS
    PowerShell initialize script for CLI

  .NOTE
    Author:   Furukawa, Atsushi <atsushifx@aglabo.com>
    License:  MIT License  https://opensource.org/licenses/MIT

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>
Set-StrictMode -version latest

# for import library
$baseDir = $PSScriptRoot
$scriptsDir = $baseDir + '/scripts/'
$libsDir = $baseDir + '/libs/'
. ($libsDir + 'commonUtils.ps1')

### prompt
## set prompt

# Invoke-Expression (&starship init powershell)
<#
  .SYNOPSIS
    set default prompt for powershell

#>
function  prompt()
{
  param()

  $isAdmin = [myUserRole]::isAdmin()
  $prompt = $isAdmin ? " # " :  " > "
  $currentPath = (Split-Path (Get-Location) -Leaf)
  $currentDrive =(Convert-Path \).substring(0, 1)
  $userName =$env:USERNAME

  # Prompt return
  return $currentDrive+": /" + $currentPath + $prompt
}


## key binding
. ($scriptsDir +'wzkeyconfig.ps1')



## Tab completion
Import-Module posh-git
Import-Module scoop-completion

# volta completions
& volta completions powershell | Out-String | Invoke-Expression

