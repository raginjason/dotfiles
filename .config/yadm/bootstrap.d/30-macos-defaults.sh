#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

# Allow key repeat in VSCode vim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

launchctl bootstrap gui/$UID ~/Library/LaunchAgents/com.local.capslock2escape.plist 2>/dev/null || true
