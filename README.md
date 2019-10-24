Setup environment in a new computer

git clone --bare https://github.com/raginjason/dotfiles.git "${HOME}"/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles checkout

dotfiles config --local status.showUntrackedFiles no
dotfiles config --local commit.gpgsign true
dotfiles config --local gpg.program gpg2

source: https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
