if [ -f ~/.profile ]; then
	source ~/.profile
fi

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

export PATH=$HOME/dotfiles/scripts:$HOME/dotfiles/scripts/private_scripts:$HOME/dotfiles/scripts/k_scripts:/usr/local/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

set_python() {
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
}

# brew install coreutils ed findutils gawk gnu-sed gnu-tar grep make
load_gnu_utils() {
	export GNUBINS="$(find $1 -type d -follow -name gnubin -print)"
	for bindir in ${GNUBINS[@]}; do
		export PATH=$bindir:$PATH
	done
}

# brew install bash-completion@2 [completions for common tools]
load_bash_completions() {
  local completion_path="${1}/profile.d/bash_completion.sh"
	[[ -r ${completion_path} ]] && . ${completion_path}
}

case "$(uname -s)" in
Darwin)
  export POETRY_VENV_HOME="$HOME/Library/Caches/pypoetry/virtualenvs"
  asdf_path="$(brew --prefix asdf)/libexec/asdf.sh"
  [[ -r ${asdf_path} ]] && . ${asdf_path}
  asdf_completion_path="$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash"
	[[ -r ${asdf_completion_path} ]] && . ${asdf_completion_path}
	case "${USER}" in
	veyga)
		export PATH="/opt/homebrew/bin:$PATH"
		set_python
		load_gnu_utils "/opt/homebrew/opt"
		load_bash_completions "/opt/homebrew/etc"
		# go
		export GOENV_ROOT="$HOME/.goenv"
		export PATH="$GOENV_ROOT/bin:$PATH"
		eval "$(goenv init -)"
		export PATH="$GOROOT/bin:$PATH"
		export PATH="$PATH:$GOPATH/bin"
		# ruby
		export RBENV_ROOT="$HOME/.rbenv"
		export PATH="$RBENV_ROOT/shims:$PATH"
		# node
		# eval "$(fnm env --use-on-cd)"
		;;
	andrew.stefanich)
    # this brew installs to /usr/local/bin and /usr/local/opt
		export PATH="/usr/local/opt:$PATH"
		set_python
		load_gnu_utils "/usr/local/opt"
		load_bash_completions "/usr/local/etc"
		# kube/helm
		export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
		# for Bit
		export PATH=$HOME/bin:$PATH
		# node
		# eval "$(fnm env --use-on-cd)"
		;;
  *)
    echo "no bash_profile for ${USER}; skipping..."
    ;;
	esac
	;;
Linux)
	source /usr/share/nvm/init-nvm.sh
	export POETRY_VENV_HOME="$HOME/.cache.pypoetry/virtualenvs"
	complete -C /usr/local/bin/terraform terraform
	helm completion bash >/usr/local/etc/bash_completion.d/helm
	;;
esac

# used for hammerspoon/init.lua
export HAMMERSPOON_DIR="$(dirname $(which hs))"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

