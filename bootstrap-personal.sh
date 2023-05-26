#!/bin/sh

dotfiles_home=`dirname $0`
machine_role='personal'

case $(uname | tr '[:upper:]' '[:lower:]') in
  darwin*)
    "${dotfiles_home}"/bootstrap-darwin.sh "${machine_role}"
  ;;
  linux*)
    "${dotfiles_home}"/bootstrap-linux.sh "${machine_role}"
  ;;
esac

git config --global user.signingkey 349DD25F
