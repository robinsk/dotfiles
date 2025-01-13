#!/usr/bin/env bash

set -e

resolve_link() {
  $(type -p greadlink readlink | head -1) "$1"
}

abs_dirname() {
  local cwd="$(pwd)"
  local path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(resolve_link "$name" || true)"
  done

  pwd
  cd "$cwd"
}

link_dotfile() {
  local source="$1"
  local target="$2"

  if [[ -L "$target" ]]; then
    echo "Already linked: $target"
  else
    echo "Linking $source -> $target"
    ln -sv "$source" "$target"
  fi
}

DOTFILES_DIR="$(abs_dirname "$0")"

link_dotfile "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"
link_dotfile "$DOTFILES_DIR/.bash_completion" "$HOME/.bash_completion"
link_dotfile "$DOTFILES_DIR/.bash_completion.d" "$HOME/.bash_completion.d"
link_dotfile "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
link_dotfile "$DOTFILES_DIR/.inputrc" "$HOME/.inputrc"
link_dotfile "$DOTFILES_DIR/.profile" "$HOME/.profile"
link_dotfile "$DOTFILES_DIR/.toprc" "$HOME/.toprc"
link_dotfile "$DOTFILES_DIR/.vim" "$HOME/.vim"
link_dotfile "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
link_dotfile "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

if [[ ! -d "$HOME/.config" ]]; then
  echo "Create $HOME/.config directory"
  mkdir "$HOME/.config"
fi
link_dotfile "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

if [[ ! -d "$HOME/Library/Application\ Support/com.mitchellh.ghostty" ]]; then
  echo "Create $HOME/Library/Application\ Support/com.mitchellh.ghostty"
  mkdir -p "$HOME/Library/Application\ Support/com.mitchellh.ghostty"
fi
link_dotfile "$DOTFILES_DIR/ghostty.config" "$HOME/Library/Application\ Support/com.mitchellh.ghostty/config"
