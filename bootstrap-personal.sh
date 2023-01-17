#!/bin/sh

machine_role='personal'

git config --global user.signingkey 349DD25F

if [[ "$OSTYPE" == "darwin"* ]]; then
  ./bootstrap-darwin.sh "${machine_role}"
elif [[ "$OSTYPE" == "linux"* ]]; then
  ./bootstrap-linux.sh "${machine_role}"
fi
