#!/usr/bin/env bash
#
# @(#) : add dotfile profile for user
#
# @version  1.0.0
# @date     2023-04-10
# @author   Furukawa, Atsushi <atsushifx@aglabo.com>
# @license  MIT
#
# @desc <<
# 
# add script for call XDG_CONFIG_HOME/profile ob .profile
#
#<<

pushd "${HOME}"

## symbolic link
#ln -s "${HOME}/.local/dotfiles/linux/.config" .
#ln -s ".config/.editorconfig" .

## add script
echo '
# dotfiles profile
if [[ -f "${XDG_CONFIG_HOME}/profile" ]] then
    . "${XDG_CONFIG_HOME}/profile"
fi
' >> ~/.profile
#
popd
