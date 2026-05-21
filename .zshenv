# Loaded for all shells (interactive, non-interactive, login, scripts).
# Use for: PATH, critical environment variables.
# Avoid: output, anything assuming a TTY.

if [[ -e '/usr/local/Homebrew/bin' ]]; then
  export PATH="${PATH}":'/usr/local/Homebrew/bin'
fi

if [[ -e '/opt/homebrew/bin' ]]; then
  export PATH="${PATH}":'/opt/homebrew/bin'
fi

if [[ -e '/Applications/Docker.app/Contents/Resources/bin' ]]; then
  export PATH="${PATH}":'/Applications/Docker.app/Contents/Resources/bin'
fi

if [ -e "${HOME}"/.rd/bin ]
then
  export PATH="${HOME}"/.rd/bin:"${PATH}"
fi

if [ -e "${HOME}"/.local/bin ]
then
  export PATH="${HOME}"/.local/bin:"${PATH}"
fi

export EDITOR='vim'

if [ -e "${HOME}"/.shell_variables ]; then
  source "${HOME}"/.shell_variables
fi
