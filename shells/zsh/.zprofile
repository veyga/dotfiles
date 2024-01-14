# This is the first thing loaded on login (if login shell is zsh)

# load globals
if [ -f ~/.profile ]; then
	source ~/.profile
fi

export PATH="$HOME/.poetry/bin:$PATH"
