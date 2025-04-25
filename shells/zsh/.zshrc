autoload -U colors && colors
export CLICOLOR=TRUE
source $HOME/.aliasrc

export EDITOR="nvim"
export LANG="en_US.UTF-8"
export PAGER="less"
case "$(uname -s)" in
   Darwin)
      export BROWSER="chrome"
      export LDFLAGS="-L/usr/local/opt/openssl/lib"
      export CPPFLAGS="-I/usr/local/opt/openssl/include"
     ;;
   Linux)
      export BROWSER="firefox"
      # source "/home/veyga/.sdkman/bin/sdkman-init.sh"
      # export SDKMAN_DIR="/Users/veyga/.sdkman"
      # [[ -s "/Users/veyga/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/veyga/.sdkman/bin/sdkman-init.sh"
      # export JAVA_HOME=~/.sdkman/candidates/java/current
     ;;
   *)
esac


export VIM_HOME="~/dotfiles/editors/vim"
export NVIM_HOME="~/dotfiles/editors/nvim"

# for colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

export PS1="
 %B%{$fg[red]%}╭─ [%n@%M] %~
 ╰─%b "
export PS2=".. "

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

HISTSIZE=100
SAVEHIST=100

fpath+=~/.zfunc

autoload -Uz compinit
compinit
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

export PATH=$HOME/dotfiles/scripts:$HOME/dotfiles/scripts/private_scripts:$PATH

# if ["$(uname)" == "Darwin"]; then
#   export POETRY_VENV_HOME="$HOME/Library/Caches/pypoetry/virtualenvs"
# elif ["$(uname)" == "Linux"]; then
#   export POETRY_VENV_HOME="$HOME/.cache/pypoetry/virtualenvs"
# fi
case "$(uname -s)" in
   Darwin)
    export POETRY_VENV_HOME="$HOME/Library/Caches/pypoetry/virtualenvs"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
    # source /usr/local/share/antigen/antigen.zsh
    # antigen bundle zsh-users/zsh-autosuggestions
    # antigen bundle zsh-users/zsh-completions
    # antigen bundle greymd/docker-zsh-completion
    # antigen bundle nnao45/zsh-kubectl-completion
    # antigen bundle lukechilds/zsh-better-npm-completion
    # antigen apply
     ;;
   Linux)
    export POETRY_VENV_HOME="$HOME/.cache/pypoetry/virtualenvs"
    source '/usr/share/nvm/init-nvm.sh'
    source /usr/share/zsh/share/antigen.zsh
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-completions
    antigen bundle greymd/docker-zsh-completion
    antigen bundle lukechilds/zsh-better-npm-completion
    antigen apply
     ;;
   *)
     echo 'RIP' 
     ;;
esac

# upgrade the nvm package will destroy installed versions?
export NVM_DIR="$HOME/.nvm"
# export PATH=/usr/local/opt/node@14/bin:$PATH
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVIM_DIR/nvm.sh"

# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
# # zplug "woefe/git-prompt.zsh", use:"{git-prompt.zsh,examples/multiline.zsh}"
# zplug load
export PATH="/usr/local/opt/helm@2/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

# for Bit
export PATH=$HOME/bin:$PATH
# tabs -4

export PYDEVD_WARN_EVALUATION_TIMEOUT=10.0

##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[[ -s "/Users/andrew.stefanich/.gvm/scripts/gvm" ]] && source "/Users/andrew.stefanich/.gvm/scripts/gvm"

complete -o nospace -C /usr/local/Cellar/packer/1.9.4/libexec/bin/packer packer

complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt
