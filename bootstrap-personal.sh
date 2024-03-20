#!/bin/sh

dotfiles_home=`dirname $0`
machine_role='personal'

case $(uname | tr '[:upper:]' '[:lower:]') in
  darwin*)
    "${dotfiles_home}"/bootstrap-darwin.sh "${machine_role}"
    /opt/homebrew/bin/brew install --cask docker
  ;;
  linux*)
    "${dotfiles_home}"/bootstrap-linux.sh "${machine_role}"
  ;;
esac

git config --global user.signingkey 349DD25F

if command -v dolt >/dev/null; then
  dolt config --global --add user.email "${GIT_AUTHOR_EMAIL}"
  dolt config --global --add user.name "$(git config --get user.name)"
fi
