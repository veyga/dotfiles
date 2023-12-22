# This is not loaded for user-veyga since login shell is zsh

# echo "LOADING BASH_PROFILE"

# load globals
if [ -f ~/.profile ]; then
	source ~/.profile
fi

export PATH="$HOME/.poetry/bin:$PATH"

# complete -C /usr/local/bin/terraform terraform

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

case "$(uname -s)" in
Darwin)
  complete -C /usr/local/Cellar/packer/1.9.4/libexec/bin/packer packer

  # for gnu utils
  GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";
  for bindir in "${GNUBINS[@]}"; do
    export PATH=$bindir:$PATH;
  done;

  helm completion bash > /usr/local/etc/bash_completion.d/helm
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
	export POETRY_VENV_HOME="$HOME/Library/Caches/pypoetry/virtualenvs"

  # for Bit
  export PATH=$HOME/bin:$PATH
  ;;
esac

