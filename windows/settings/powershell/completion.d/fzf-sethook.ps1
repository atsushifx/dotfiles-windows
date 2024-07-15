<#
  .SYNOPSIS
  prompt fzf completion

  .DESCRIPTION
    set fzf tab compleltion to powershell CLI.

  .NOTES
    @Author   Furukawa, Atsushi <atsushifx@aglabo.com>
    @License  MIT License https://opensource.org/licenses/MIT

    @date     2023-12-12
    @Version  1.0.0

#>
Set-PSReadLineKeyHandler -Key Shift+tab -ScriptBlock { Invoke-FzfTabCompletion }

