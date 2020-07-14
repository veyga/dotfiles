# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/dotfiles/shells/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# plugins not found in AUR should be cloned here and sourced accordingly
# export ZSHPLUGINSDIR="$HOME/.config/zsh-plugins-sources"

# needed for some things to autoload??  affects load path?
export ZDOTDIR="$SHELLS_HOME/zsh"
autoload -U colors && colors
source $SHELLS_HOME/.aliases
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/doc/find-the-command/ftc.zsh 2>/dev/null

# sets vim mode for terminal commands
bindkey -v

autoload -U compinit && compinit

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/shells/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/shells/zsh/.p10k.zsh ]] || source ~/dotfiles/shells/zsh/.p10k.zsh

# SDKMAN must be in the rc files (does not properly load if placed in .profile)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/veyga/.sdkman"
[[ -s "/home/veyga/.sdkman/bin/sdkman-init.sh" ]] && source "/home/veyga/.sdkman/bin/sdkman-init.sh"

