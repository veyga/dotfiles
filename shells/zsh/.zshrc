source $SHELLS_HOME/.aliases




# This must be in the rc files (does not properly load if placed in .profile)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/veyga/.sdkman"
[[ -s "/home/veyga/.sdkman/bin/sdkman-init.sh" ]] && source "/home/veyga/.sdkman/bin/sdkman-init.sh"

# export EDITOR="nvim"
# export TERM="xterm-256color"
# export TERMINAL="termite"
# export LANG="en_US.UTF-8"
# export PAGER="less"
# export BROWSER="firefox"
# export ZDOTDIR="$HOME/dotfiles/shells/zsh"
# export NVIM_HOME="$HOME/dotfiles/editors/nvim"
# export VIM_HOME="$HOME/dotfiles/editors/vim"
# export CC=/usr/bin/clang
# export CXX=/usr/bin/clang++
# export PATH=$PATH:/home/veyga/Android/Sdk/platform-tools
# export PATH=/home/veyga/.local/bin:$PATH
# alias lal="ls -Alh"
# alias lsg="ls -lh --group-directories-first"
# alias lalg="ls -alh --group-directories-first"
# alias chrome="google-chrome-stable"
# alias pacmanremoveorphans="sudo pacman -Rns \$(pacman -Qtdq)"
# alias batsave="sudo tlp start && sudo powertop --auto-tune"
# fpath+=~/.zfunc
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# POWERLEVEL9K_MODE="nerdfont-complete"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# plugins=(
# 	git
# 	zsh-autosuggestions
# )


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# sets vim mode for terminal commands
bindkey -v

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/home/veyga/.sdkman"
# [[ -s "/home/veyga/.sdkman/bin/sdkman-init.sh" ]] && source "/home/veyga/.sdkman/bin/sdkman-init.sh"
# export PATH=/home/veyga/.local/share/fury/bin:/home/veyga/.local/share/fury/opt:$PATH # Added by Fury
# fpath=(/home/veyga/.local/share/fury/usr/0.15.1-73-gc13865e/script /home/veyga/.local/share/fury/completions $fpath) # Added by Fury
# autoload -U compinit && compinit # Added by Fury
