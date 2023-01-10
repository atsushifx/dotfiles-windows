<#
  .SYNOPSIS
	command line editing functions library

  .NOTES

	@Author		Furukawa, Atsushi <atsushifx@aglabo.com>
	@License	MIT License https://opensource.org/licenses/MIT

	@Version	1.0.0

	static functions for command line (readline) editing.
	for execute these function, need install peco and coreutils.

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND.
THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>
Set-StrictMode -version latest

<#
	.SYNOPSYS
	execute cmdlet for history,
	using switch -send is input command to cli

	.NOTES
	normal use, this function only call invoke-expression

	.REMARKS
	parameter send is used for keyhandler
#>
function Execute_Command() {
	param(
		[Parameter(Mandatory)][string]$command,
		[Switch]$send
	)

	if ($send) {
		# execute command with readline function
		[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
		[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert($command)
		if ($?) {
			[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
		}
	}
 else {
		Invoke-Expression($command)
	}
}

<#
	.SYNOPSYS
	select command line using peco and execute it.
	caution: for execute this function, you must install tac, peco

	.NOTES
	display history and select using tac & peco
	then select, execute it.

	.REMARKS
	parameter send is used for keyhandler
#>
function Execute_History() {
	param(
		[switch]$send
	)
	$history = (Get-Content -Path (Get-PSReadLineOption).HistorySavePath -Tail 20)
	$command = ($history) | tac | peco --select-1 --on-cancel error
	if ($?) {
		Execute_Command $command -send:$send
	}
 else {
		[PSConsoleHostReadLine]::AcceptLine()
	}
}

Set-Alias -Name hh -Value "Execute_History"
