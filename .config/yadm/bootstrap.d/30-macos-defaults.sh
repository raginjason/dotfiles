#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

# Allow key repeat in VSCode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Key repeat rate and initial delay (2–120, lower is faster)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

launchctl bootstrap gui/$UID ~/Library/LaunchAgents/com.local.capslock2escape.plist 2>/dev/null || true
