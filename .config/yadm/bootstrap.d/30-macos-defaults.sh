#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

# Allow key repeat in VSCode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
