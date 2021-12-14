<#
  .SYNOPSIS
   create or remobe symbolic link(s)

  .DESCRIPTION
   symlink $link $target ... create symbolic link
   symlink -r $target ... remove symbolic link

  .PARAMETER r
   symlink remove switch


  .EXAMPLE
   symlink -r temp\app

  .NOTES
   Author: Atsushi Furukawa <atsushifx@aglabo.com>]
   License: MIT License  https://opensource.org/licenses/MITo

THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.

#>
$Script = $MyInvocation.MyCommand.path
param(
  [switch] $r

)



<#
  .SYNOPSIS
    check file, directory is link

#>
function global:isLink([string] $mypath)
{


}

get-help isLink

