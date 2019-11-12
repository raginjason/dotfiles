# OSX considers all terminals login shells

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# OSX color ls
alias ls='ls -G'

export GREP_OPTIONS='--color=auto'
PS1="$(~/.bash_prompt) "
export PS1

if grep -q -s Welltok /etc/motd; then
  machine_role='work'
else
  machine_role='home'
fi

case $machine_role in
  work)
    export GIT_AUTHOR_EMAIL='jason.walker@welltok.com'
    git config --global user.signingkey 1B1DCCAD2A0F1EF7
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

if [ -e '/usr/local/apache-ant-1.10.7/bin' ]; then
  export PATH="${PATH}":'/usr/local/apache-ant-1.10.7/bin'
fi

if [ -e "${HOME}"/.bash_profile_local ]; then
  source "${HOME}"/.bash_profile_local
fi

for f in "${HOME}"/.bash_completion.d/*; do
  source "${f}"
done
