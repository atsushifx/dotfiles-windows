#!/usr/bin/env bash
#
# @(#) : setup system opt directory from dotfiles
#
# @version  1.0.0
# @author   Furukawa Atsushi <atsushifx@aglabo.com>
# @date     2023-12-23
# @license  MIT
#
# @desc <<
# create symbolic from dotfiles 'linux/opt/*' to '/opt/*'
#
#<<

## create link on $HOME
pushd "$HOME"

ln -s ./.local/dotfiles/linux/.config .
ln -s ./.config/.editorconfig .

popd

## create /opt dirs
_optdir="${HOME}/.local/dotfiles/linux/opt"

for d in $(ls "${_optdir}/" ); do
  sudo chown -R root:root "${_optdir}/$d"
  if [[ ! -d "/opt/$d" ]]; then
    sudo ln -s "$_optdir/$d" /opt
  fi
done

## remove old dotfiles
rm -f ~/.bash_history ~/.viminfo

# End 
