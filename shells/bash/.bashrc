# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# autoload doesn't work in bash?
# autoload -U colors && colors
export CLICOLOR=TRUE

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/bash/history

export PS2=".. "
source $HOME/dotfiles/shells/.aliasrc

# Load Bash plugins
loadbashplugins() {

  local findcommand=/usr/share/doc/find-the-command/ftc.bash
  [[ -e "$findcommand" ]] && source $findcommand 2>/dev/null

}
loadbashplugins
