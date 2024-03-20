#!/bin/sh

dotfiles_home=`dirname $0`
machine_role='fanduel'

case $(uname | tr '[:upper:]' '[:lower:]') in
  darwin*)
    "${dotfiles_home}"/bootstrap-darwin.sh "${machine_role}"
    /opt/homebrew/bin/brew install --cask rancher
  ;;
  linux*)
    "${dotfiles_home}"/bootstrap-linux.sh "${machine_role}"
  ;;
esac
