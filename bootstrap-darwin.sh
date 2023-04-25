#!/bin/sh

machine_role="$1"
dotfiles_home=$(realpath $(dirname $0))

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/usr/local/bin/brew install awscli@2
/usr/local/bin/brew install --cask visual-studio-code
/usr/local/bin/brew install --cask sourcetree
/usr/local/bin/brew install --cask iterm2
/usr/local/bin/brew install --cask macvim
/usr/local/bin/brew install --cask gpg-suite
/usr/local/bin/brew install --cask slack
/usr/local/bin/brew install --cask macdown
/usr/local/bin/brew install --cask docker
/usr/local/bin/brew install --cask brave-browser
/usr/local/bin/brew install --cask azure-data-studio
/usr/local/bin/brew tap common-fate/granted
/usr/local/bin/brew install granted
/usr/local/bin/brew install jq

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

if command -v code >/dev/null; then
  code --force --install-extension vscodevim.vim
  code --force --install-extension streetsidesoftware.code-spell-checker
fi
