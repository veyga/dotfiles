# if [ -f ~/.bash_profile ]; then
# 	source ~/.bash_profile
# fi

source "$HOME"/.aliasrc

export VISUAL="nvim"

export CLICOLOR=1

export PS2=".. "
# autoload edit-command-line; zle -N edit-command-line

export PS1="
 \[\033[01;95m\]╭─ [\u@\H] \w
 ╰─\[\033[0m\] "

set -o vi

export PATH=$HOME/dotfiles/scripts:$HOME/dotfiles/scripts/private_scripts:$HOME/dotfiles/scripts/k_scripts:$PATH:/usr/local/bin:/usr/local/opt

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export NVM_DIR="$HOME/.nvm"

case "$(uname -s)" in
Darwin)
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh";;
Linux)
	export POETRY_VENV_HOME="$HOME/.cache.pypoetry/virtualenvs"
  source /usr/share/nvm/init-nvm.sh
  [[ -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
  [[ -f /etc/profile.d/rvm.sh ]] && \
    . /etc/profile.d/rvm.sh
  export PATH="$PATH:$HOME/.ghcup/bin"
	;;
esac

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

if [ -f ~/.inputrc ]; then
  source ~/.inputrc
fi

[[ -s "/home/veyga/.gvm/scripts/gvm" ]] && source "/home/veyga/.gvm/scripts/gvm"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
