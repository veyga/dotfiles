autoload -U colors && colors
export CLICOLOR=TRUE


# function __virtualenv_ps1 {
#     echo "${VIRTUAL_ENV:+(venv:${VIRTUAL_ENV##*/})}"
# }
# # disable the default virtualenv prompt change
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# # the '...' are for irrelevant info here.
# export PS1="%~ $(__virtualenv_ps1) $ "

## TODO git integration / pyenv right align
export PS1="
 %B%{$fg[magenta]%}╭─ %~
 ╰─%b "
export PS2=".. "

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# this doesn't really load the menus
# autoload -U compinit && compinit

# sets vim mode for terminal commands
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
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
## end of Change cursor shape for different vi modes.

# Edit line in vim with ctrl-e (must be in insert mode):
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


source $HOME/dotfiles/shells/.aliasrc
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/doc/find-the-command/ftc.zsh 2>/dev/null

# SDKMAN must be in the rc files (does not properly load if placed in .profile)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/veyga/.sdkman"
[[ -s "/home/veyga/.sdkman/bin/sdkman-init.sh" ]] && source "/home/veyga/.sdkman/bin/sdkman-init.sh"



# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

