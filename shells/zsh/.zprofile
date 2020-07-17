# This is the first thing loaded on login (login shell is zsh)

# load globals 
if [ -f $HOME/.profile ]; then
	source $HOME/.profile
fi

