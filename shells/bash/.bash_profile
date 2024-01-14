if [ -f ~/.profile ]; then
 source ~/.profile
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH=$HOME/dotfiles/scripts:$HOME/dotfiles/scripts/private_scripts:$HOME/dotfiles/scripts/k_scripts:/usr/local/bin:/usr/local/opt:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

set_python() {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
}

case "$(uname -s)" in
Darwin)
 export POETRY_VENV_HOME="$HOME/Library/Caches/pypoetry/virtualenvs"
 case "${USER}" in
 veyga)
    export PATH="/opt/homebrew/bin:$PATH"
    set_python
		[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
    # go
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_ROOT/bin:$PATH"
    eval "$(goenv init -)"
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$PATH:$GOPATH/bin"
    # ruby
    export RBENV_ROOT="$HOME/.rbenv"
    export PATH="$RBENV_ROOT/shims:$PATH"
    # gnu bins
		export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
		export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
		export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
    # node
    eval "$(fnm env --use-on-cd)"
    # lua
    [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
    [ -s ~/.luaver/completions/luaver.bash ] && . ~/.luaver/completions/luaver.bash
		;;
	*)
    set_python
		[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
		;;
	esac
  ;;
Linux)
  source /usr/share/nvm/init-nvm.sh
  [[ -f /usr/share/bash-completion/bash_completion ]] &&  . /usr/share/bash-completion/bash_completion
	export POETRY_VENV_HOME="$HOME/.cache.pypoetry/virtualenvs"
  complete -C /usr/local/bin/terraform terraform
  # for gnu utils
  GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";
  for bindir in "${GNUBINS[@]}"; do
    export PATH=$bindir:$PATH;
  done;
  helm completion bash > /usr/local/etc/bash_completion.d/helm
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
 	# for Bit
 	export PATH=$HOME/bin:$PATH
 	;;
esac

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
