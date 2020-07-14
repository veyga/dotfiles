autoload -U colors && colors
source $HOME/dotfiles/shells/.aliasrc
source /usr/share/doc/find-the-command/ftc.bash 2>/dev/null

# This must be in the rc files (does not properly load if placed in .profile)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/veyga/.sdkman"
[[ -s "/home/veyga/.sdkman/bin/sdkman-init.sh" ]] && source "/home/veyga/.sdkman/bin/sdkman-init.sh"


