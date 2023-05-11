# use this for environment variables
# aliases can not be exported from one instance of bash/zsh to another (see ".aliases")
# echo "LOADING PROFILE"
export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR="nvim"
# leave this commented as it conflicts with tmux
# export TERM="xterm-256color"
export TERMINAL="xterm"
export LANG="en_US.UTF-8"
export PAGER="less"
case "$(uname -s)" in
   Darwin)
      export BROWSER="chrome"
      export SHELL="/usr/local/bin/bash"
     ;;
   Linux)
      export BROWSER="firefox"
      export GDK_SCALE=2
      export GDK_DPI_SCALE=0.5
      export SHELL="/usr/bin/bash"
     ;;
   *)
esac
export NVIM_HOME="$HOME/dotfiles/editors/nvim"
export VIM_HOME="$HOME/dotfiles/editors/vim"
export SHELLS_HOME="$HOME/dotfiles/shells"
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# for colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export PATH="$HOME/.poetry/bin:$PATH"
