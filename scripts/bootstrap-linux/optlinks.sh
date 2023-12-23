#!/usr/bin/env bash
#
# @(#) : setup system opt directory from dotfiles
#
# @version  1.0.0
# @author   Furukawa Atsushi <atsushifx@aglabo.com>
# @date     2023-12-23
# @license  MIT
#
# @description <<
# create symbolic from dotfiles opt/* to /opt/*
#
#<<

_optdir="${HOME}/.local/dotfiles/linux/opt"

for d in $(ls "${_optdir}/" ); do
  if [[ ! -d "/opt/$d" ]]; then
    sudo ln -s "$_optdir/$d" /opt
  fi
done
