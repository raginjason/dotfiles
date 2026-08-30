#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

# Allow key repeat in VSCode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Key repeat rate and initial delay (2–120, lower is faster)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

launchctl bootstrap gui/$UID ~/Library/LaunchAgents/com.local.capslock2escape.plist 2>/dev/null || true

# Never sleep when on AC power
sudo pmset -c sleep 0

defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
