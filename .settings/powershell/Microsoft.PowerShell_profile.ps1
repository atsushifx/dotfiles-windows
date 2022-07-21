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

### functions
function private:write-sudo-messages() {
  $white = "$([char]0x1b)[37;1m"
   $cyan = "$([char]0x1b)[36;1m"
   $neutral = "$([char]0x1b)[m"
   $messages = "${white}貴方は領主様から通常の講習を受けたはずですわ｡${neutral}`n${white}それらは通常に以下3点に要約されますの｡${neutral}
    ${cyan}#1${neutral}) 市民の皆様のプライバシーを尊重すること｡
    ${cyan}#2${neutral}) おタイプする前に考えること。
    ${cyan}#3${neutral}) そしてノブレス・オブリージュを肝に銘じておくことですわ！"
  $messages | write-output
}



## prompt
# Invoke-Expression (&starship init powershell)
<#
  .SYNOPSIS
    set default prompt for powershell

#>
function prompt()
{
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

## input History Plugin
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -Colors @{ InLinePrediction = $PSStyle.Foreground.cyan }


# sudo messages
if ([myUserRole]::isAdmin()) {
  write-sudo-messages;
}

## Tab completion
Import-Module posh-git
Import-Module scoop-completion

# volta completions
& volta completions powershell | Out-String | Invoke-Expression

