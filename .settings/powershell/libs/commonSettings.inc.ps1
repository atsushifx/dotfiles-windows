<#
  .SYNOPSIS
    frequency use functions library

  .NOTES

	@Author		Furukawa, Atsushi <atsushifx@aglabo.com>
	@License	MIT License https://opensource.org/licenses/MIT

	@Version	1.0.1

	script common settings & common use functions
	set default constants abouot common Libraries directory, scripts directory, ...


THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND.
THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>
Set-StrictMode -version latest

## Set common Constants
$baseDir = (Split-Path -Path $PROFILE)
set-Variable -Option Constant -Name THISCMD -Value (Split-Path -Leaf $MyInvocation.PSCommandPath) -Description "executes command"
Set-Variable -Option Constant -Name LIBSDIR -Value $baseDir'/libs/' -Description 'common libs directory'
Set-Variable -Option Constant -Name SCRIPTSDIR -Value $baseDir'/scripts/' -Description 'Common scripts directory'
Set-Variable -Option Constant -Name WORKINGDIR -Value (Get-Location).Path -Description 'Script works directory'

<#
 # static function class for check user role
 #
 # check current user is elevated as 'Administrator'
 #
 #
 #>
class myUserRole {
	hidden static [Security.Principal.WindowsPrincipal]  $principal = [myUserRole]::getCurrentPrincipal()

	# get current windows principal
	hidden static [Security.Principal.WindowsPrincipal] getCurrentPrincipal() {
		$id = [Security.Principal.WindowsIdentity]::GetCurrent()
		$pr = [Security.Principal.WindowsPrincipal] $id
		return $pr
	}

	#
	static [bool]  hasRole([Security.Principal.WindowsBuiltInRole] $role) {
		<#
      .SYNOPSIS
        check current user has role parameter

      .PARAMETER
        $role
        user role (Administrator, User, ...)
    #>
		return [myUserRole]::principal.IsInRole([Security.Principal.WindowsBuiltinRole] $role)
	}

	#
	static [bool]  isAdmin() {
		<#
      check user as 'Administrator'
    #>
		return [myUserRole]::hasRole([Security.Principal.WindowsBuiltinRole]::Administrator)
	}
}

<#
  .SYNOPSIS
    select command from history and execute

  .DESCRIPTION
    select history wuth peco and set command line to execute this.


  .EXAMPLE
    Set-PSReadLineKeyHandler -chord Ctrl+p -scriptBlock { SelectandExecHistory }
    using above that hit ctrl+p to use this.

#>
function global:SelectandExecHistory() {
	$selectCmd = (tail -20 (Get-PSReadLineOption).HistorySavePath) | peco --select-1 --on-cancel error
	if ($?) {
		[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
		[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
		[Microsoft.PowerShell.PSConsoleReadLine]::Insert($selectCmd)
		# [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine()
		# [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
	}
 else {
		[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
	}
}
