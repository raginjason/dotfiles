#!/bin/sh

machine_role='datascan'

git config --global user.signingkey D39AF0B2

if [ "$OSTYPE" == "darwin"* ]; then
  ./bootstrap-darwin.sh "${machine_role}"
elif [ "$OSTYPE" == "linux"* ]; then
  ./bootstrap-linux.sh "${machine_role}"
fi
