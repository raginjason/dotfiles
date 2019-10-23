# OSX considers all terminals login shells

# OSX color ls
alias ls='ls -G'

export GREP_OPTIONS='--color=auto'
export PS1="$(~/.bash_prompt) "

if [ -e ~/.bash_profile_local ]; then
  source ~/.bash_profile_local
fi

for f in ~/.bash_completion.d/*; do
  source "${f}"
done
