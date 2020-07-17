# This is not loaded for users whose login shell is zsh

# load globals
if [ -f $HOME/.profile ]; then
	source $HOME/.profile
fi
