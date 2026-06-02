#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

brew install cmux
brew install starship

brew install --cask visual-studio-code
brew install --cask claude
brew install --cask macvim
brew install --cask font-meslo-lg-nerd-font
# Set the dynamic profile (DynamicProfiles/default.json) as iTerm2's default
defaults write com.googlecode.iterm2 "Default Bookmark Guid" "A1B2C3D4-E5F6-7890-ABCD-EF1234567890"
# Set Terminal.app's Basic profile font; font name is PostScript name, not family name
osascript -e 'tell application "Terminal" to set font name of settings set "Basic" to "MesloLGSNFM-Regular"'

eval "$(/usr/libexec/path_helper -s)"

case "$YADM_CLASS" in
  personal)
    brew install --cask discord
    ;;
esac
