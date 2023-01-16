#!/bin/sh

# Assume this is run from the current directory
dotfiles_dir="${PWD}"

for f in .gitconfig .ideavimrc .inputrc .vimrc .zshenv .zshrc; do
  (cd "${HOME}" && ln -s "${dotfiles_dir}"/"${f}" "${f}")
done

# Work
git config --global user.signingkey D39AF0B2
