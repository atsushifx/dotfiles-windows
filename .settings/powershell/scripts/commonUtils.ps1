<#
  .SYNOPSIS
    PowerShell common functions for initial script

  .NOTE
    Author:   Furukawa, Atsushi <atsushifx@aglabo.com>
    License:  MIT License  https://opensource.org/licenses/MIT

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>
Set-StrictMode -version latest



<#
  .SYNOPSIS
    select command from history and execute

  .DESCRIPTION
    select history wuth peco and set command line to execute this.


  .EXAMPLE
    Set-PSReadLineKeyHandler -chord Ctrl+p -scriptBlock { SelectandExecHistory }
    using above that hit ctrl+p to use this.

#>
function global:SelectandExecHistory()
{
	$selectCmd = (tail -20 (Get-PSReadLineOption).HistorySavePath)|peco --select-1 --on-cancel error
	if ($?) {
		[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
		[Microsoft.PowerShell.PSConsoleReadLine]::AddLine($selectCmd)
		[Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
		# [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
	} else {
		[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
	}
}
