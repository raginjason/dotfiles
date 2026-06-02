#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

brew install cmux

brew install --cask visual-studio-code
brew install --cask claude
brew install --cask macvim

case "$YADM_CLASS" in
  personal)
    brew install --cask discord
    ;;
esac
