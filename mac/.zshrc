autoload -U colors && colors
export CLICOLOR=TRUE
source $HOME/.aliasrc

export PS1="
 %B%{$fg[magenta]%}╭─ [%n@%M] %~
 ╰─%b "
export PS2=".. "

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

HISTSIZE=100
SAVEHIST=100

fpath+=~/.zfunc

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit -u # prompts every time to confirm on mac
# _comp_options+=(globdots)		# Include hidden files.
setopt globdots

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

bindkey -v
export KEYTIMEOUT=1
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e (must be in insert mode):
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

export PATH=$HOME/.local/bin:$HOME/.local/scripts:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# export PATH=/usr/local/opt/node@14/bin:$PATH

source /usr/local/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle greymd/docker-zsh-completion
antigen apply


# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
# # zplug "woefe/git-prompt.zsh", use:"{git-prompt.zsh,examples/multiline.zsh}"
# zplug load
