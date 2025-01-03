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

DOTFILES_DIR="$(abs_dirname "$0")"

ln -s "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$DOTFILES_DIR/.bash_completion" "$HOME/.bash_completion"
ln -s "$DOTFILES_DIR/.bash_completion.d" "$HOME/.bash_completion.d"
ln -s "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
ln -s "$DOTFILES_DIR/.inputrc" "$HOME/.inputrc"
ln -s "$DOTFILES_DIR/.profile" "$HOME/.profile"
ln -s "$DOTFILES_DIR/.toprc" "$HOME/.toprc"
ln -s "$DOTFILES_DIR/.vim" "$HOME/.vim"
ln -s "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
