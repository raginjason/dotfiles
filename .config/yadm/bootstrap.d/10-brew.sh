#!/bin/sh

[ "$YADM_OS" = "Darwin" ] || exit 0

command -v brew >/dev/null && exit 0

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
