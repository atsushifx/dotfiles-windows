## Powershell initialize script
#
#
#
##

# Invoke-Expression (&starship init powershell)

function isAdmin()
{
	((([Security.Principal.WindowsPrincipal] `
		[Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    			[Security.Principal.WindowsBuiltInRole] "Administrator"` )))
}

# prompt
function prompt()
{
	$isAdmin =  isAdmin
    	$prompt = $isAdmin ? " # " :  " > "
    	$currentPath = (Split-Path (Get-Location) -Leaf)
    	$currentDrive =(Convert-Path \).substring(0, 1)
	$userName =$env:USERNAME

	# Prompt return
	$currentDrive+": /" + $currentPath + $prompt
}

# work path
$isAdmin =  isAdmin
$currentdir = (convert-path .)
$homedir = (convert-path ~ )
if ( (!$isAdmin) -and ($currentdir -eq $homedir) ) {
	set-location "~/workspaces"
}
