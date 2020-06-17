#  Aliases
alias ls="ls -GlAhF"
alias serve="caddy file-server --listen :2222" # quick web server

# Can I remember how nvm works? no.
alias node-lts="nvm install \"lts/*\" && nvm alias default \"lts/*\""
alias node-latest="nvm install node && nvm use node"
alias cps="jq '.scripts' package.json" # list scripts from package.json


# Personal settings
source "$ZDOTDIR/.personal"


# Misc
setopt HIST_IGNORE_DUPS
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export EDITOR="vim"
export PATH=/usr/local/bin:$PATH # prioritise brews over system binaries

# Refer to https://carlosbecker.com/posts/speeding-up-zsh/
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $HOME/.zcompdump) ]; then
  compinit -d "$HOME/.zcompdump"
else
  compinit -d "$HOME/.zcompdump" -C
fi


# External dependencies
# https://github.com/lukechilds/zsh-nvm
export NVM_LAZY_LOAD=true # don't be so slow
source "$DOTFILEADDONSDIR/zsh-nvm/zsh-nvm.plugin.zsh"

# https://github.com/zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=true
source "$DOTFILEADDONSDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"


# Prompt
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
eval "$(starship init zsh)"