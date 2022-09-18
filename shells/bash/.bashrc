# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# autoload doesn't work in bash?
# autoload -U colors && colors
export CLICOLOR=TRUE

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000

export PS2=".. "
source $HOME/dotfiles/shells/.aliasrc

# Load Bash plugins
loadbashplugins() {

  local findcommand=/usr/share/doc/find-the-command/ftc.bash
  [[ -e "$findcommand" ]] && source $findcommand 2>/dev/null

}
loadbashplugins


set -o vi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
