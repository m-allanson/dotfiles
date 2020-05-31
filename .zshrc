#  Aliases
alias ls="ls -GlAhF"
alias cps="cat package.json | jq '.scripts'" # list scripts from package.json
alias serve="caddy file-server --listen :2222" # quick web server

# Can I remember how nvm works? no.
alias node-lts="nvm install \"lts/*\" && nvm alias default \"lts/*\""
alias node-latest="nvm install node && nvm use node"


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

# Install zsh-nvm https://github.com/lukechilds/zsh-nvm
export NVM_LAZY_LOAD=true # don't be so slow
source "$HOME/.zsh/.zsh-nvm/zsh-nvm.plugin.zsh"

# Autosuggestions for fish style autocompletion. Installed via 'brew install zsh-autosuggestions'
export ZSH_AUTOSUGGEST_USE_ASYNC=true
source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"


#  Prompt
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
eval "$(starship init zsh)" # https://github.com/starship/starship

# Test start up time:
# for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done