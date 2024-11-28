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
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

