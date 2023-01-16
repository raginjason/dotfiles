#!/bin/sh

# Assume this is run from the current directory
dotfiles_dir="${PWD}"

for f in .bash_profile .bashrc .gitconfig .ideavimrc .inputrc .vimrc .zshenv .zshrc; do
  (cd "${HOME}" && ln -s "${dotfiles_dir}"/"${f}" "${f}")
done

# TODO this is hardcoded as work key. Figure out better way to deal with logic
git config --global user.signingkey D39AF0B2
