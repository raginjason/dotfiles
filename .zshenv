# All invocations of the shell. It should contain commands to set the command search path, plus other important environment variables. `.zshenv' should not contain commands that produce output or assume the shell is attached to a tty.

if [[ -e '/usr/local/Homebrew/bin' ]]; then
  export PATH="${PATH}":'/usr/local/Homebrew/bin'
fi

if [[ -e '/opt/homebrew/bin' ]]; then
  export PATH="${PATH}":'/opt/homebrew/bin'
fi

if [[ -e '/Applications/Docker.app/Contents/Resources/bin' ]]; then
  export PATH="${PATH}":'/Applications/Docker.app/Contents/Resources/bin'
fi

if [ -e "${HOME}"/.shell_variables ]; then
  source "${HOME}"/.shell_variables
fi
