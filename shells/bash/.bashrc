# if [ -f ~/.bash_profile ]; then
# 	source ~/.bash_profile
# fi

source "$HOME"/.aliasrc

export CLICOLOR=1

export PS2=".. "
# autoload edit-command-line; zle -N edit-command-line

export PS1="
\[\033[01;95m\]╭─ [\u@\H] \w
╰─\[\033[0m\] "

set -o vi

if [ -f ~/.inputrc ]; then
  source ~/.inputrc
fi
[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
[ -s ~/.luaver/completions/luaver.bash ] && . ~/.luaver/completions/luaver.bash
