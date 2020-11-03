# This is not loaded for user-veyga since login shell is zsh

# load globals
if [ -f ~/.profile ]; then
	source ~/.profile
fi

export PATH="$HOME/.poetry/bin:$PATH"
