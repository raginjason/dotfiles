#!/bin/sh

dotfiles_home=`dirname $0`
machine_role='datascan'

git config --global user.signingkey D39AF0B2

case $(uname | tr '[:upper:]' '[:lower:]') in
  darwin*)
    "${dotfiles_home}"/bootstrap-darwin.sh "${machine_role}"
  ;;
  linux*)
    "${dotfiles_home}"/bootstrap-linux.sh "${machine_role}"
  ;;
esac
