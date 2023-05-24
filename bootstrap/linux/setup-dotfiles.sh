#!/usr/bin/env bash
#
# @(#) : setup dotfiles from github
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

pushd ${HOME}

## initialize directories
echo -n "Init Directories"
dirs=(
  ~/.local/share
  ~/.local/cache
  ~/.local/state
  ~/temp
  ~/workspaces/temp  
)
~/bin/makedirs-arglist.sh "${dirs[@]}"

##
# initialize dotfiles
#
cd ~/.local
git clone --depth=1 https://github.com/atsushifx/dotfiles.git
ln -s ~/.local/dotfiles/linux/.config ~


# Eno of Program
popd
