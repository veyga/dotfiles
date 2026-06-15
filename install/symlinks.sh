#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${HOME}/dotfiles"

symlink() {
  local link="$1"
  local target="$2"
  mkdir -p "$(dirname "$link")"
  # ln -sfn "$target" "$link"
  ln -sf "$target" "$link"
  echo "  $link -> $target"
}

echo "Creating symlinks..."

# Home directory
symlink "${HOME}/.tmux.conf"       "${DOTFILES}/terminals/.tmux.conf"
symlink "${HOME}/.bashrc"          "${DOTFILES}/shells/bash/.bashrc"
symlink "${HOME}/.bash_profile"    "${DOTFILES}/shells/bash/.bash_profile"
symlink "${HOME}/.zshrc"           "${DOTFILES}/shells/zsh/.zshrc"
symlink "${HOME}/.zprofile"        "${DOTFILES}/shells/zsh/.zprofile"
symlink "${HOME}/.profile"         "${DOTFILES}/shells/.profile"
symlink "${HOME}/.aliasrc"         "${DOTFILES}/shells/.aliasrc"
symlink "${HOME}/.inputrc"         "${DOTFILES}/shells/.inputrc"
symlink "${HOME}/.tool-versions"   "${DOTFILES}/other/.tool-versions"
symlink "${HOME}/.skhdrc"          "${DOTFILES}/mac/skhd/.skhdrc"
symlink "${HOME}/.vimrc"           "${DOTFILES}/editors/vim/.vimrc"
symlink "${HOME}/.yabairc"         "${DOTFILES}/mac/yabai/.yabairc"
symlink "${HOME}/.hammerspoon"     "${DOTFILES}/mac/hammerspoon"

# ~/.config
symlink "${HOME}/.config/nvim"                    "${DOTFILES}/editors/nvim"
symlink "${HOME}/.config/kitty"                   "${DOTFILES}/terminals/kitty"
symlink "${HOME}/.config/karabiner"               "${DOTFILES}/mac/karabiner"
symlink "${HOME}/.config/borders/bordersrc"       "${DOTFILES}/mac/borders/bordersrc"
symlink "${HOME}/.config/aerospace/aerospace.toml" "${DOTFILES}/mac/aerospace/config.toml"

# Internal dotfiles symlinks
symlink "${DOTFILES}/editors/nvim/nvimlua" "${DOTFILES}/editors/nvimlua"

echo "Done."
