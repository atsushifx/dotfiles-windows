 <#
  .SYNOPSIS
  windows setup script

  .DESCRIPTION
  fiist setup script after windows installed.
  setup path & other environment
  install App Manager as winget & scoop
  setup above app managers,

#>


# get current directory
$Script = $MyInvocation.MyCommand.path
$ScriptDir = split-path -parent #Scrip


