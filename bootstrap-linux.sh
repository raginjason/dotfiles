#!/bin/bash

machine_role="$1"
dotfiles_home=$(realpath $(dirname $0))

declare -a files

if [ -f /.dockerenv ]; then
  files+=(".bash_profile" ".bash_prompt" ".bashrc" ".inputrc" ".vimrc" ".zshenv" ".zshrc" ".shell_variables")
else
  files+=(".bash_profile" ".bash_prompt" ".bashrc" ".gitconfig" ".inputrc" ".vimrc" ".zshenv" ".zshrc" ".shell_variables")
  if command -v code >/dev/null; then
    code --force --install-extension vscodevim.vim
    code --force --install-extension streetsidesoftware.code-spell-checker
  fi
fi

for f in "${files[@]}"; do
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

