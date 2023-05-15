if [ -f ~/.bash_profile ]; then
	source ~/.bash_profile
fi


source "$HOME"/.aliasrc

export VISUAL="nvim"

export CLICOLOR=1

export PS2=".. "
# autoload edit-command-line; zle -N edit-command-line

export PS1="
 \[\033[01;95m\]╭─ [\u@\H] \w
 ╰─\[\033[0m\] "

set -o vi

export PATH=$HOME/dotfiles/scripts:$HOME/dotfiles/scripts/private_scripts:$PATH:/usr/local/bin:/usr/local/opt

# for Bit
export PATH=$HOME/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export NVM_DIR="$HOME/.nvm"

case "$(uname -s)" in
Darwin)
	export POETRY_VENV_HOME="$HOME/Library/Caches/pypoetry/virtualenvs"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh";;
Linux)
	export POETRY_VENV_HOME="$HOME/.cache.pypoetry/virtualenvs"
	;;
esac

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

# if [ -f ~/.inputrc ]; then
# 	source ~/.inputrc
# fi
