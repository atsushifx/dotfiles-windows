<#
  .SYNOPSIS
    PowerShell initialize script for CLI

  .NOTE
    Author:   Furukawa, Atsushi <atsushifx@aglabo.com>
    License:  MIT License  https://opensource.org/licenses/MIT

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>

## Script Setup
Set-StrictMode -version latest
. ((Split-Path -Path ($profile)) + '/libs/commonSettings.inc.ps1')

### Libralies
. ($LIBSDIR + "/cliFunctions.inc.ps1")  # for readline function


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
  $isAdmin = [myUserRole]::isAdmin()
  $prompt = $isAdmin ? " # " :  " > "
  $currentPath = (Split-Path (Get-Location) -Leaf)
  $currentDrive = (Convert-Path \).substring(0, 1)
  $userName = $env:USERNAME

  # Prompt return
  $currentDrive + ": /" + $currentPath + $prompt
}

## setup current directory
## ランチャー内やシステムディレクトリのときは、カレントディレクトリを移動
if ($WORKINGDIR.Contains('AppData') -OR $WORKINGDIR.Contains('Windows')) {
  Set-Location '~/workspaces'

  # WORKINGDIRを再設定
  Remove-Item Variable:\WORKINGDIR -Force
  Set-Variable -Option ReadOnly -Name WORKINGDIR -Value (Get-Location).Path -Description 'Script works directory'

}

## Add Path for dotnet
$newPath = $env:path
$newPath += ';C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\Roslyn'
$newPath += ';C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\IDE\CommonExtensions\Microsoft\FSharp\Tools'
$newPath += ';C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.32.31326\bin\Hostx64\x64'
$env:path = $newPath


## input History Plugin
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{ InLinePrediction = [ConsoleColor]::Cyan }

## key binding
. ($LIBSDIR + 'keyconfig.inc.ps1')


## Modules
Import-Module posh-wakatime

## tab completion

### completion modules
Import-Module -Name CompletionPredictor
Import-Module posh-git
Import-Module scoop-completion

#   winget completion
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
  [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
  $Local:word = $wordToComplete.Replace('"', '""')
  $Local:ast = $commandAst.ToString().Replace('"', '""')
  winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}

#  githib cli
gh completion -s powershell | Out-String | Invoke-Expression

#   volta completions
& volta completions powershell | Out-String | Invoke-Expression





# sudo messages
if ([myUserRole]::isAdmin()) {
  write-sudo-messages;
}

