#!/bin/bash

# Ensure yadm is installed
if ! command -v yadm >/dev/null; then
  if command -v brew >/dev/null; then
    brew install yadm
  elif command -v apt-get >/dev/null; then
    sudo apt-get update && sudo apt-get install yadm
  else
    echo "Unsupported yadm platform"
    exit
  fi
else
  echo "yadm is already installed"
fi

# VS Code clones the dotfiles repo on our behalf, but yadm wants to manage it
# in its own way. No need to go over the network again, just tell yadm to clone
# from the already checked-out git repo.
yadm clone ~/dotfiles
