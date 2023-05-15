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

