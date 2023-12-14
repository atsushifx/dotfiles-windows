<#
  .SYNOPSIS
    gibo tab completion script

  .DESCRIPTION
    set up gibo tab completion function for powershell.

  .NOTES
    @Author   Furukawa, Atsushi <atsushifx@aglabo.com>
    @License  MIT License https://opensource.org/licenses/MIT

    @date     2023-12-12
    @Version  1.0.0

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND.
THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.
#>
gibo completion powershell | Out-String | Invoke-Expression
