Setup environment in a new computer

git clone --bare https://github.com/ragin.jason/dotfiles.git "${HOME}"/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles checkout

maybe: dotfiles config --local status.showUntrackedFiles no
