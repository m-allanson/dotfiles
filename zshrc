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
alias serve="caddy file-server  --listen :2222"

# Because I can never remember how to tell nvm "install newest LTS and set it to default"
alias node-lts="nvm install \"lts/*\" && nvm alias default \"lts/*\""
alias node-latest="nvm install node && nvm use node"

#
#  Configs & completions
#-------------------------------------------------------------------------------

# git
# git config --global user.name "check secrets"
# git config --global user.email "check secrets"
# git config --global github.user "check secrets"
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

# autocompletion
autoload -Uz compinit && compinit

# fish style autocompletion. installed via 'brew install zsh-autosuggestions'
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# nvm. Uses the zsh-nvm zsh plugin https://github.com/lukechilds/zsh-nvm
export NVM_LAZY_LOAD=true # was it nvm that caused the delay on new terminal windows?!
source ~/.zsh/.zsh-nvm/zsh-nvm.plugin.zsh

# better npm completion. https://github.com/lukechilds/zsh-better-npm-completion
source ~/.zsh/.zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh


#
#  Prompt
#-------------------------------------------------------------------------------

# https://github.com/starship/starship
eval "$(starship init zsh)"

#
#  Other
#-------------------------------------------------------------------------------

# TODO: run compinit(?) and do any other completion setups
# TODO: prompt twiddling?
# TODO: investigate making plugin / completion installation less manual. Maybe dotbot (https://github.com/anishathalye/dotbot) or adding some gitupdate commands to publish.sh
# TODO: delete old bash related configs from ~?
