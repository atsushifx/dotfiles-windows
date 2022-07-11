##
#
# @(#) : shell script common utilities (function)
#
# @version  1.0.0
# @author   Furukawa,Atsushi <atsushifxx@aglabo.com>
# @date     2022-07-11
# @license  MIT
#
# @desc<<
#
# common utility function libray for shell script
#
#
# THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND.
# THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.
#
#<<



### utility functions

#
# _isBinary : check if filetype is text / binary
#
# @param filename
# @return text : file is text filea / binary : file is binary(ELF exe, ...)
#
#@desciription <<
#
##<<
_isBinary() {
  local _filetype
  _filetype=$( file "$1" )
  if [[ "${_filetype}" =~ "text" ]]; then
    echo "text"
  else
    echo "binary"
  fi
}


### logger

#
# _error : output error message to stderr
#
# @description <<
# output error message to stderr
# with command name and date-time
#
#<<
_error() {
  local _date

  _date = $( date+'%Y-%m-%d %H:%M:%S' )
  echo "[ $0 $_date ]: $*" >&2
}


### End of File
return 0
