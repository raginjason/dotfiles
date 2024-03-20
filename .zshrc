# For interactive shells: aliases, functions, options, key bindings, etc.

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# OSX/BSD color ls
export CLICOLOR=1

# Default OSX/BSD colors are exfxcxdxbxegedabagacad
# Change dirs to bold cyan so they show better on dark backgrounds
export LSCOLORS='Exfxcxdxbxegedabagacad'

export GREP_OPTIONS='--color=auto'

export EDITOR='vim'

# Homebrew completion; assumes `brew completions link` already ran
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# vi mode
bindkey -v

# https://granted.dev
alias assume="source assume"

if [ -e "${HOME}"/.rd/bin ]
then
  export PATH="${HOME}"/.rd/bin:"${PATH}"
fi
