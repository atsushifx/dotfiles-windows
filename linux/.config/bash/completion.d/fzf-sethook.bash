# @(#) fzf completion with readline
#
# @version  1.0.0
# @date     2023-04-30
# @author   Furukawa Atsushi
# @license  MIT
#
# @desc <<
#
# fzf completion script with readline input
#
#<<

function fzf-sethook() {
  export FZF_DEFAULT_OPTS="--height 40% --border"
  . "${BASHSCRIPTS_DIR}/fzf-bash-completion.sh"
  bind -x '"\e[Z": fzf_bash_completion'
}

fzf --version >/dev/null 2>&1 && fzf-sethook
unset fzf-sethook
