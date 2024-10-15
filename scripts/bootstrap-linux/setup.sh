#!/usr/bin/env bash
# @(#) : .config setup script
#
#


# main
cd ~
rm -r .config
ln -s ~/.local/dotfiles/linux/.config .
rm .editorconfig
ln -s ~/.config/.editorconfig .

