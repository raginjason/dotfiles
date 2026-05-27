# Loaded for interactive shells (login and non-login).
# Use for: aliases, functions, prompt, key bindings, completions.
# Avoid: anything only needed at login (use .zprofile).

case "${OSTYPE}" in
  darwin*)
    # OSX/BSD color ls
    export CLICOLOR=1

    # Default OSX/BSD colors are exfxcxdxbxegedabagacad
    # Change dirs to bold cyan so they show better on dark backgrounds
    export LSCOLORS='Exfxcxdxbxegedabagacad'
    ;;
  linux*)
    alias ls='ls --color=auto'
    ;;
esac

export GREP_OPTIONS='--color=auto'

# Homebrew completion; assumes `brew completions link` already ran
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# vi mode
bindkey -v

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info add-zsh-hook
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats ' %F{yellow}(%b)%f'
add-zsh-hook precmd vcs_info

_wb="%B%F{white}"
_r="%b%f"
_uc="%F{cyan}"
(( EUID == 0 )) && _uc="%F{red}"
if [[ -f /.dockerenv ]]; then
  _PS1_HOST="container"
  _hc="%B%F{green}"
elif [[ -n "$SSH_TTY" ]]; then
  _PS1_HOST="mbp"
  _hc="%B%F{yellow}"
else
  _PS1_HOST="mbp"
  _hc="${_r}"
fi
PROMPT="${_wb}[${_uc}%n${_wb}@${_hc}${_PS1_HOST}${_wb}:%1~\${vcs_info_msg_0_}${_wb}]${_uc}%#${_r} "
unset _wb _r _uc _hc

# https://granted.dev
alias assume="source assume"

# OpenClaw Completion
if [ -e "${HOME}"/.openclaw/completions/openclaw.zsh ]
then
  source "${HOME}"/.openclaw/completions/openclaw.zsh
fi
