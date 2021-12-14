<#
  .SYNOPSIS
   PowerShell initialize script for CLI

  .NOTE
   Author Atsushi Furukawa <atsushifx@aglabo.com>
   License: MIT License  https://opensource.org/licenses/MITo

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>
Set-StrictMode -version latest

# for import library
$Script = $MyInvocation.MyCommand.path
$myLibsDir = $PSScriptRoot + '/libs'
. ($myLibsDir + '/commonUtils.ps1')

## prompt
# Invoke-Expression (&starship init powershell)
function prompt()
{
  <#
    .SYNOPSIS
      set CLI prompt

  #>

  $isAdmin = [myUserRole]::isAdmin()
  $prompt = $isAdmin ? " # " :  " > "
  $currentPath = (Split-Path (Get-Location) -Leaf)
  $currentDrive =(Convert-Path \).substring(0, 1)
  $userName =$env:USERNAME

  # Prompt return
  $currentDrive+": /" + $currentPath + $prompt
}


