if [ -f " ~/.secrets" ]; then
  source "~/.secrets"
fi

#
#  Aliases
#-------------------------------------------------------------------------------

# Nice ls
#   -l Long format with details
#   -A Almost all (include hidden, exclude . and ..)
#   -h Human readable file sizes
#   -G or --color-auto Colourise output on Linux and OSX
#   -F Classify entries with one of the following types
#     * Executable
#     / Directory
#     @ Symlink
#     | Pipe
#     = Socket
alias ls="ls -GlAhF"

# Cat Package.json Scripts
alias cps="cat package.json | jq '.scripts'"

# Quick web server (using Caddy 2.0)
alias serve="caddy file-server"


#
#  Configs & completions
#-------------------------------------------------------------------------------

# git
git config --global user.name "Mike Allanson"
git config --global user.email "michael.allanson@gmail.com"
git config --global github.user "m-allanson"
# git config --global github.token "check secrets"


# Make vim the default editor
export EDITOR="vim"

export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_DUPS

# Give priority to brews over system binaries
export PATH=/usr/local/bin:$PATH

# Make sure global npm binaries are available
export PATH=/usr/local/share/npm/bin:$PATH

# heroku autocomplete. Created via "heroku autocomplete:script zsh"
HEROKU_AC_ZSH_SETUP_PATH=/Users/mike/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# git autocomplete.
# Copy both these files to the dir:
# - https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
# - https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
#
# These instructions from https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/.zsh-git-completion/git-completion.zsh
fpath=(~/.zsh/.zsh-git-completion $fpath)
autoload -Uz compinit && compinit

# nvm. Uses the zsh-nvm zsh plugin https://github.com/lukechilds/zsh-nvm
export NVM_LAZY_LOAD=true # was it nvm that caused the delay on new terminal windows?!
source ~/.zsh/.zsh-nvm/zsh-nvm.plugin.zsh

# better npm completion. https://github.com/lukechilds/zsh-better-npm-completion
source ~/.zsh/.zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh


#
#  Prompt
#-------------------------------------------------------------------------------

# Pure prompt. https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

# optional options
PURE_CMD_MAX_EXEC_TIME=10

# fire it up
prompt pure

#
#  Other
#-------------------------------------------------------------------------------

# TODO: run compinit and do any other completion setups
# TODO: prompt twiddling?
# TODO: investigate making plugin / completion installation less manual
