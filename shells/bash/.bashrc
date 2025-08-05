# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"
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

# no name, with kube
export PS1="
\[\033[01;95m\]╭─ \w\$(kube_prompt)
╰─\[\033[0m\] "

export PS2=".. "

set -o vi

if [ -f ~/.inputrc ]; then
  bind -f ~/.inputrc
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/andrewstefanich/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
