# use this for environment variables
# aliases can not be exported from one instance of bash/zsh to another (see ".aliases")
export BASH_SILENCE_DEPRECATION_WARNING=1
export LANG="en_US.UTF-8"
export PAGER="less"
export VISUAL="nvim"
export EDITOR="nvim"
export NVIM_HOME="$HOME/dotfiles/editors/nvim"
export VIM_HOME="$HOME/dotfiles/editors/vim"
export SHELLS_HOME="$HOME/dotfiles/shells"
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
# leave this commented as it conflicts with tmux
# export TERM="xterm-256color"

# for colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

case "$(uname -s)" in
   Darwin)
      export SHELL="/opt/homebrew/bin/bash"
      export TERMINAL="kitty"
      case "${USER}" in
        veyga)
          export BROWSER="firefox"
          ;;
        andrewstefanich)
          export BROWSER="chrome"
          ;;
        esac
        ;;
   Linux)
      export TERMINAL="xterm"
      export BROWSER="firefox"
      export GDK_SCALE=2
      export GDK_DPI_SCALE=0.5
      export SHELL="/usr/bin/bash"
     ;;
   *)
esac
