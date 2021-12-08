<#
  .SYNOPSIS
    freq use functions library


  .NOTES

    Author: Atsushi Furukawa
    License: https://opensource.org/licenses/MIT

    Version 1.0.0

#>

class myUserRole
{
  hidden static [Security.Principal.WindowsPrincipal]  $principal = [myUserRole]::getCurrentPrincipal()

  # get current windows principal
  hidden static [Security.Principal.WindowsPrincipal] getCurrentPrincipal()
  {
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    $pr = [Security.Principal.WindowsPrincipal] $id
    return $pr
  }

  #
  static [bool]  hasRole([Security.Principal.WindowsBuiltInRole] $role)
  {
    return [myUserRole]::principal.IsInRole($role)
  }

  #
  static [bool]  isAdmin()
  {
    return [myUserRole]::hasRole([Security.Principal.WindowsBuiltinRole]::Administrator)
  }


}

