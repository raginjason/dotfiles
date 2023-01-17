#!/bin/sh

machine_role='datascan'

git config --global user.signingkey D39AF0B2

case "${OSTYPE}" in
  "darwin"*)
    ./bootstrap-darwin.sh "${machine_role}"
  ;;
  "linux"*)
    ./bootstrap-linux.sh "${machine_role}"
  ;;
esac
