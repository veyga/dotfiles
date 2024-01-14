echo ".profile loaded" | tee "/Users/veyga/profile.log"
export PROFILE_LOADED=true


# use this for environment variables
# aliases can not be exported from one instance of bash/zsh to another (see ".aliases")
# echo "LOADING PROFILE"
export BASH_SILENCE_DEPRECATION_WARNING=1
export VISUAL="vim"
export EDITOR="nvim"
# leave this commented as it conflicts with tmux
# export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export PAGER="less"
case "$(uname -s)" in
   Darwin)
      export SHELL="/usr/local/bin/bash"
      case "${USER}" in
      veyga)
	      export BROWSER="firefox"
        ;;
      *)
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
export NVIM_HOME="$HOME/dotfiles/editors/nvim"
export VIM_HOME="$HOME/dotfiles/editors/vim"
export SHELLS_HOME="$HOME/dotfiles/shells"
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# for colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

