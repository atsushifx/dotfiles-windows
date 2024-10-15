<#
.SYNOPSYS
install scoop script & tools

.DESCRIPTION
setup scoop Environment, and install scoop.
after then, setup directory and path

#>


##
## setup Enironment & install scoop
##
[SystemEnvironment]::SetEnvironmentVariable('SCOOP_GLOBAL', 'c:\app\scoop', 'Machine')
mkdir -force $env:SCOOP_GLOBAL
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

## setup bucket
scoop bucket add extras
scoop bucket add iyokan-jp

scoop update

##

## install tools
scoop install 7z  -g
scoop install git  -g


