# use this for environment variables
# aliases can not be exported from one instance of bash/zsh to another (see ".aliases")
export EDITOR="nvim"
export TERM="xterm-256color"
export TERMINAL="xterm"
export LANG="en_US.UTF-8"
export PAGER="less"
export BROWSER="firefox"
export NVIM_HOME="$HOME/dotfiles/editors/nvim"
export VIM_HOME="$HOME/dotfiles/editors/vim"
export SHELLS_HOME="$HOME/dotfiles/shells"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export PATH=/home/veyga/.local/bin:/home/veyga/.local/bin/custom:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/home/veyga/Android/Sdk/platform-tools

# for colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
