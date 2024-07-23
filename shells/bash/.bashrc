if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

source "$HOME"/.aliasrc

export CLICOLOR=1

export PS1="
\[\033[01;95m\]╭─ [\u@\H] \w
╰─\[\033[0m\] "

export PS2=".. "

set -o vi

if [ -f ~/.inputrc ]; then
  bind -f ~/.inputrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
