#!/bin/sh

machine_role="$1"
dotfiles_home=$(realpath $(dirname $0))

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/opt/homebrew/bin/brew install awscli@2
/opt/homebrew/bin/brew install --cask visual-studio-code
/opt/homebrew/bin/brew install --cask sourcetree
/opt/homebrew/bin/brew install --cask iterm2
/opt/homebrew/bin/brew install --cask macvim
/opt/homebrew/bin/brew install --cask gpg-suite
/opt/homebrew/bin/brew install --cask slack
/opt/homebrew/bin/brew install --cask macdown
/opt/homebrew/bin/brew install --cask docker
/opt/homebrew/bin/brew install --cask brave-browser
/opt/homebrew/bin/brew install --cask azure-data-studio
/opt/homebrew/bin/brew tap common-fate/granted
/opt/homebrew/bin/brew install granted
/opt/homebrew/bin/brew install jq

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

docker_etc=/Applications/Docker.app/Contents/Resources/etc
if [ -e "${docker_etc}" ]; then
  ln -sf "${docker_etc}"/docker.bash-completion "${HOME}"/.bash_completion.d/docker
  ln -sf "${docker_etc}"/docker-compose.bash-completion "${HOME}"/.bash_completion.d/docker-compose
fi

