# ~/.profile: executed by the command interpreter for login shells.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

echo "Exec .config/.profile"

# // functions
isInteractive() {
  case $- in
    *i*) return 1;;
      *) return 0;;
  esac
  return 1;
}

##  common environ settingsth
. ~/.config/.common.env

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi

  # user defined bashrc
  if [[ isInteractive ]] && [[ -f ${HOME}/.config/bash/bashrc ]]; then
    . ${HOME}/.config/bash/bashrc
  fi
fi

# opam configuration
# test -r /home/atsushifx/.opam/opam-init/init.sh && . /home/atsushifx/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
