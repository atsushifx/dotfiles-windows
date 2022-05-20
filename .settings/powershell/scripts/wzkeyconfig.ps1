<#
  .SYNOPSIS
    PowerShell key config script

  .NOTE
    Author:   Furukawa, Atsushi <atsushifx@aglabo.com>
    License:  MIT License  https://opensource.org/licenses/MIT

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>

## Wz like key bindings
Set-PSReadLineOption -EditMode windows

# windows defaukt
Set-PSReadLineKeyHandler -chord Ctrl+A -function SelectAll
Set-PSReadLineKeyHandler -chord Ctrl+X -function cut
Set-PSReadLineKeyHandler -chord Ctrl+C -function copy

# Wz/Vz like +alpha
Set-PSReadLineKeyHandler -chord Ctrl+a -function ShellBackwardWord
Set-PSReadLineKeyHandler -chord Ctrl+s -function BackwardChar
Set-PSReadLineKeyHandler -chord Ctrl+d -function ForwardChar
Set-PSReadLineKeyHandler -chord Ctrl+f -function ShellForwardWord

Set-PSReadLineKeyHandler -chord Ctrl+g -function DeleteChar
Set-PSReadLineKeyHandler -chord Ctrl+t -function DeleteWord
Set-PSReadLineKeyHandler -chord Ctrl+u -function DeleteLine
Set-PSReadLineKeyHandler -chord Ctrl+y -function Paste
Set-PSReadLineKeyHandler -chord Ctrl+j -function Paste

# history
Set-PSReadLineKeyHandler -chord Ctrl+p -function PreviousHistory
Set-PSReadLineKeyHandler -chord Ctrl+n -function NextHistory

Set-PSReadLineKeyHandler -chord Ctrl+e -function PreviousHistory
Set-PSReadLineKeyHandler -chord Ctrl+x -function NextHistory

