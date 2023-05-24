#!/usr/bin/env bash
#
# @(#) : make directories from arguments
#
# @version 1.0.0
# @author  Furukawa, Atsushi <atsushifx@aglabo.com>
# @date    2023-05-24
# @license MIT
#
# @desc <<
#
#<<

# bootstrap
set -euC -o pipefail
readonly THISCMD="$0"

readonly SCRIPTDIR=$(
  cd "$(dirname "$0")"
  pwd
)
readonly WORKINGDIR="$(pwd)"
readonly LIBDIR="${SCRIPTDIR}/inc"

##
for arg do
  mkdir -p "${arg}"
done
