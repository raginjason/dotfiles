# All invocations of the shell. It should contain commands to set the command search path, plus other important environment variables. `.zshenv' should not contain commands that produce output or assume the shell is attached to a tty.

if [[ "${LOGNAME}" == 'jason.walker' ]]; then
  machine_role='work'
else
  machine_role='home'
fi

case $machine_role in
  work)
    export GIT_AUTHOR_EMAIL='jason.walker@onedatascan.com'
    git config --global user.signingkey D39AF0B2
    ;;
  *)
    export GIT_AUTHOR_EMAIL='ragin.jason@me.com'
    git config --global user.signingkey 349DD25F
    ;;
esac

export GIT_COMMITTER_EMAIL="${GIT_AUTHOR_EMAIL}"

if [[ -e '/usr/local/Homebrew/bin' ]]; then
  export PATH="${PATH}":'/usr/local/Homebrew/bin'
fi

