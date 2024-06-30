<#
  .SYNOPSIS
    PowerShell initialize script for CLI

  .DESCRIPTION
    powershell initialize script.
    this is:
      set Script Vsrisble through `libs/commonSettings.inc.ps1'
      set predictiion wuth completion
      customize key config
      setup completion from `completion.d/*/ps1'
      set wakatime heartbeat


  .NOTES
    @Author   Furukawa, Atsushi <atsushifx@aglabo.com>
    @License  MIT License https://opensource.org/licenses/MIT

    @Date     2023-05-31
    @Version  1.0.5

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND.
THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.
#>

## Script Setup
Set-StrictMode -version latest
. $PSScriptRoot'/libs/commonSettings.inc.ps1'
setupScriptCommonConstants

### Libralies
. ($LIBSDIR + "cliFunctions.inc.ps1")  # for readline function


$private:baseDir = Split-Path -path $profile

### functions
function private:write-sudo-messages() {
  $white = "$([char]0x1b)[37;1m"
  $cyan = "$([char]0x1b)[36;1m"
  $neutral = "$([char]0x1b)[m"
  $messages = "${white}You gave ...${neutral}`n
    ${cyan}#1${neutral}) Respect the privacy of others.
    ${cyan}#2${neutral}) Think before you type.
    ${cyan}#3${neutral}) With great power comes great responsibility.
  "
  $messages | write-output
}

## prompt
# Invoke-Expression (&starship init powershell)
<#
  .SYNOPSIS
    set default prompt for powershell

#>
function global:prompt() {

  # define prompt
  $isAdmin = [aglaUserRole]::isAdmin()
  $psChar = $isAdmin ? " # " :  " > "
  $currentPath = (Split-Path (Get-Location) -Leaf)
  $currentDrive = (Convert-Path \).substring(0, 1)
  $userName = $env:USERNAME

  # Prompt return
  $prompt = $currentDrive + ": /" + $currentPath + $psChar
  $prompt
}

## setup current directory
##
if ($WORKINGDIR.Contains('AppData') -OR $WORKINGDIR.Contains('Windows')) {
  Set-Location '~/workspaces'

  # WORKINGDIRを再設定
  Remove-Item Variable:\WORKINGDIR -Force
  Set-Variable -Option ReadOnly -Scope Global -Name WORKINGDIR -Value (Get-Location).Path -Description 'Script works directory'

}

## input History Plugin
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{ InLinePrediction = [ConsoleColor]::Cyan }

## key binding
. ($LIBSDIR + "keyconfig.inc.ps1" )

### Modules

## scoop
Invoke-Expression (&scoop-search-multisource -hook)

## tab completion
Import-Module -Name CompletionPredictor
Get-ChildItem -Path "$basedir/completion.d/*.ps1" | ForEach-Object { . $_.FullName }

# Wakatime setup
. $PSScriptRoot'/scripts/pwsh-wakatime.ps1"

# sudo messages
if ([aglaUserRole]::isAdmin()) {
  write-sudo-messages;
}

# BuildTools Path
$env:path += "C:\app\develop\VS\VC\Tools\MSVC\14.39.33519\bin\Hostx64\x64;"
$env:path += "C:\app\develop\VS\MSBuild\Current\Bin\Roslyn;"
$env:path += "C:\app\develop\VS\Common7\IDE\CommonExtensions\Microsoft\FSharp\Tools;"

# setup ocaml
# (& opam env) -split '\r?\n' | ForEach-Object { Invoke-Expression $_ }

