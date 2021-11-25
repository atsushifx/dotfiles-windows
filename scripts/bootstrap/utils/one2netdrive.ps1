 <#
  .SYNOPSIS
  test onedrive mapped to network drive


  .DESCRIPTION
  Adds a file name extension to a supplied name.
  Takes any strings for the file name or extension.
#>

$user='atsushifx@aglabo.com'
$cid='<my onedrive cid>'
$share = '\\d.docs.live.net/' + $cid

$cred = get-credential $user
#
New-PSDrive -Name S -PSProvider FileSystem -Root $share -credential $cred
dir s:

