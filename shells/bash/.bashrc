# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash"

if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

kube_prompt() {
    # Get current context
    local ctx
    ctx=$(kubectl config current-context 2>/dev/null)
    if [ -z "$ctx" ]; then
        echo ""
        return
    fi

    # Get current namespace for that context
    local ns
    ns=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    # If namespace is empty, use default
    if [ -z "$ns" ]; then
        ns="default"
    fi

    echo " ($ctx:$ns)"
}

source "$HOME"/.aliasrc

export CLICOLOR=1

# no kube
# export PS1="
# \[\033[01;95m\]╭─ [\u@\H] \w
# ╰─\[\033[0m\] "

# full with kube
# export PS1="
# \[\033[01;95m\]╭─ [\u@\H] \w\$(kube_prompt)
# ╰─\[\033[0m\] "
#
export PS1="
\[\033[01;95m\]╭─ \w\$(echo "")
╰─\[\033[0m\] "

# no name, with kube
export PS1="
\[\033[01;95m\]╭─ \w\$(kube_prompt)
╰─\[\033[0m\] "

export PS2=".. "

set -o vi

if [ -f ~/.inputrc ]; then
    bind -f ~/.inputrc
fi

eval "$(zoxide init bash)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/andrewstefanich/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# had to do this for nvim mason install
# sudo chown -R $(whoami) ~/.npm
# rm -rf ~/.local/share/nvim/lazy/nvim-treesitter
#
# brew install composer php
# brew install luarocks

# source /Users/astefanich/.gvm/scripts/gvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env" || true
