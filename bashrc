# delete this? macOS terminal doesn't actually source this file. https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/

# Include .bash_profile as long as we're in an interactive shell
#[ -n "$PS1" ] && . ~/.bash_profile

# pyenv
#eval "$(pyenv init -)"

# virtual env wrapper config
#export VIRTUALENVWRAPPER_PYTHON=/Users/mike/.pyenv/shims/python3
#export WORKON_HOME=~/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

# Homebrew shell autocompletion https://docs.brew.sh/Shell-Completion
#if type brew 2&>/dev/null; then
#  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
#    source "$completion_file"
#  done
#fi