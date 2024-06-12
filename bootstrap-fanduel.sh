#!/bin/sh

dotfiles_home=`dirname $0`
machine_role='fanduel'

git config --global user.signingkey 1B17DF9CE0FF984A7BE2F033D7EF114F30003F59
git config --global user.name "Jason Walker"

case $(uname | tr '[:upper:]' '[:lower:]') in
  darwin*)
    "${dotfiles_home}"/bootstrap-darwin.sh "${machine_role}"
    /opt/homebrew/bin/brew install --cask rancher
  ;;
  linux*)
    "${dotfiles_home}"/bootstrap-linux.sh "${machine_role}"
  ;;
esac
