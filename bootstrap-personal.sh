#!/bin/sh

machine_role='personal'

git config --global user.signingkey 349DD25F

case "${OSTYPE}" in
  "darwin"*)
    ./bootstrap-darwin.sh "${machine_role}"
  ;;
  "linux"*)
    ./bootstrap-linux.sh "${machine_role}"
  ;;
esac
