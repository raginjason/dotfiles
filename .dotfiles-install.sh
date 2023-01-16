#!/bin/sh

echo "running dotfile install"

for f in .gitconfig .ideavimrc .inputrc .vimrc .zshenv .zshrc; do
  ln -s "${f}" "${HOME}"/"${f}"
done

# Work
git config --global user.signingkey D39AF0B2
