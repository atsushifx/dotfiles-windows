# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする

# ヒストリの設定
HISTFILE="${XDG_DATA_HOME}/zsh/.zsh_hist"
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT='%F{green}%n@%m%F{magenta} /%C%f %# '
