# If not running interactively, don't do anything
[[ $- != *i* ]] && return

autoload -U colors && colors
export CLICOLOR=TRUE
source $HOME/dotfiles/shells/.aliasrc

export PS1="
 %B%{$fg[magenta]%}╭─ [%n@%M] %~
 ╰─%b "
export PS2=".. "

HISTSIZE=100
SAVEHIST=100
# HISTFILE=~/.cache/zsh/history

# Load ZSH plugins
loadzshplugins() {
 
  # needs to be before compinit
  fpath+=~/.zfunc

  local autosuggestions=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  [[ -e "$autosuggestions" ]] && source $autosuggestions 2>/dev/null

  local findcommand=/usr/share/doc/find-the-command/ftc.zsh
  [[ -e "$findcommand" ]] && source $findcommand 2>/dev/null

  source $HOME/dotfiles/shells/zsh/plugins/mvn/mvn.plugin.zsh 2>/dev/null
  source $HOME/dotfiles/shells/zsh/plugins/npm/zsh-better-npm-completion.plugin.zsh 2>/dev/null
}
loadzshplugins

# autoload -U compinit && compinit   # (this doesn't really load the menus?)
# # Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# # sets vim mode for terminal commands
bindkey -v
export KEYTIMEOUT=1

# # Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# ## END of Change cursor shape for different vi modes.

# Edit line in vim with ctrl-e (must be in insert mode):
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


source <(kubectl completion zsh)

# Update PATH variables
export PATH=$HOME/.local/bin:$HOME/.local/scripts:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# [[ -d "$HOME/.pyenv" ]] && eval "$(pyenv init -)"

# SDKMAN must be in the rc files (does not properly load if placed in .profile)
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

complete -C '/usr/bin/aws_completer' aws
autoload bashcompinit && bashcompinit

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
