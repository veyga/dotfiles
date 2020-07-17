# autoload doesn't work in bash
# autoload -U colors && colors
export CLICOLOR=TRUE

# # TODO git integration/ pyvenvs?
# export PS1="
# %B%{$fg[magenta]%}╭─ %~
# ╰─%b "

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/bash/history

export PS2=".. "
source $HOME/dotfiles/shells/.aliasrc
source /usr/share/doc/find-the-command/ftc.bash 2>/dev/null

# This must be in the rc files (does not properly load if placed in .profile)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


