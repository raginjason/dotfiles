#!/bin/sh

machine_role="$1"
dotfiles_home=$(realpath $(dirname $0))

# Key repeat in VSCode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

for f in .bash_profile .bash_prompt .bashrc .gitconfig .ideavimrc .inputrc .vimrc .zshenv .zshrc .shell_variables 'Library/Application Support/Code/User/settings.json'; do
  if [ -e "${dotfiles_home}"/"${machine_role}"/"${f}" ]; then
    source_file="${dotfiles_home}"/"${machine_role}"/"${f}"
    echo "Using ${machine_role} override for ${f}"
  elif [ -e "${dotfiles_home}"/"${f}" ]; then
    source_file="${dotfiles_home}"/"${f}"
    echo "Using default for ${f}"
  else
    echo "Could not locate source file ${f}, skipping"
    continue
  fi
  (cd "${HOME}" && ln -nsf "${source_file}" "${f}")
done
