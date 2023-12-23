#!/usr/bin/env bash
#
# @(#) : add `call profile scripts' to '/etc/profilei', '~/.profilea'
#
# @version  1.0.0
# @author   Furukawa Atsushi <atsushifx@aglabo.com>
# @date     2023-12-23
# @license  MIT
#
# @description <<
# add script about call 'dotfiles profile' to '/etc/profile'
# add script about call 'dotfiles profile for user' to `~/.profile`
#
# caution: this script need sudo with exec
#<<

echo '
if [[ -f "/opt/etc/profile" ]]; then
  . /opt/etc/profile
fi
' >> /etc/profile

# for user
echo '
## exec dotfiles
if [[ -f "$HOME/.config/profile" ]]; then
  . $HOME/.config/profile
fi
' >> ~/.profile
