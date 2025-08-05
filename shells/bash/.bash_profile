# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash"
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
	export PATH="$HOME/.local/bin:$PATH" # for pipx/uv installations?
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
		# set_python
		load_gnu_utils "/opt/homebrew/opt"
		load_bash_completions "/opt/homebrew/etc"
		export PATH="/opt/homebrew/bin:$PATH"
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
	andrewstefanich)
    # this brew installs to /opt/homebrew/opt
		set_python
    # # uv
    # export PATH="/Users/andrewstefanich/.local/bin:$PATH"
		load_gnu_utils "/opt/homebrew/opt"
		load_bash_completions "/opt/homebrew/etc"
		export PATH="/opt/homebrew/bin:$PATH"
		# kube/helm
		export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
		# for Bit
		export PATH=$HOME/bin:$PATH
    export PATH="$HOME/.tfenv/bin:$PATH"
		# export VOLTA_HOME="$HOME/.volta"
		# export PATH="$VOLTA_HOME/bin:$PATH"
		# node
		# eval "$(fnm env --use-on-cd)"
    # needed for some compilers to find zlib bzip2(after brew install zlib bzip2)
    # this is from install python 3.6
    export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/bzip2/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/bzip2/include"
    complete -C /opt/homebrew/bin/terragrunt terragrunt
    export DOCKER_BUILDKIT=0
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
# export HAMMERSPOON_DIR="$(dirname $(which hs))"

# export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/andrewstefanich/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
