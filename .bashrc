# Include .bash_profile as long as we're in an interactive shell

[ -n "$PS1" ] && . ~/.bash_profile

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
