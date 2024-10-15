<#

#>
# system variable refer
$sysEnv = [System.Environment]

# HOME
$newHOME=$env:USERPROFILE+"/.config"
$Env:HOME=$newHOME
$sysEnv::SetEnvironmentVariable("HOME", $newHOME, "USER")

#





