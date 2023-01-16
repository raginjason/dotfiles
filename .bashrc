# OSX considers all terminals login shells

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# OSX/BSD color ls
export CLICOLOR=1

# Default OSX/BSD colors are exfxcxdxbxegedabagacad
# Change dirs to bold cyan so they show better on dark backgrounds
export LSCOLORS='Exfxcxdxbxegedabagacad'

export GREP_OPTIONS='--color=auto'
PS1="$(~/.bash_prompt) "
export PS1

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

if [ -e '/usr/local/scala-2.11.12/bin' ]; then
  export PATH="${PATH}":'/usr/local/scala-2.11.12/bin'
fi

if [ -e '/usr/local/scala-2.13.1/bin' ]; then
  export PATH="${PATH}":'/usr/local/scala-2.13.1/bin'
fi

if [ -e '/usr/local/apache-ant-1.10.7/bin' ]; then
  export PATH="${PATH}":'/usr/local/apache-ant-1.10.7/bin'
fi

if [ -e "$(python3 -m site --user-base)"/bin ]; then
  export PATH="${PATH}":"$(python3 -m site --user-base)"/bin
fi

if [ -e "${HOME}"/dev/homebrew/bin ]; then
  export PATH="${PATH}":"${HOME}"/dev/homebrew/bin
  if [ -e "${HOME}"/dev/homebrew/etc/bash_completion.d ]; then
    for f in "${HOME}"/dev/homebrew/etc/bash_completion.d/*; do
      source "${f}"
    done
  fi
fi

if [ -e "${HOME}"/go/bin ]; then
  export PATH="${PATH}":"${HOME}"/go/bin
fi

if [ -e "${HOME}"/.bash_profile_local ]; then
  source "${HOME}"/.bash_profile_local
fi

if [ -e "${HOME}"/.bash_completion.d ]; then
  for f in "${HOME}"/.bash_completion.d/*; do
    source "${f}"
  done
fi

alias assume="source assume"
