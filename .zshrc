#  Aliases
alias ls="ls -GlAhF"
alias cps="jq '.scripts' package.json" # list scripts from package.json
alias s="serve" # quick web server https://github.com/vercel/serve
alias m="smerge"
alias merge="smerge"


# Personal settings
source "$ZDOTDIR/.personal"


# Misc
setopt HIST_IGNORE_DUPS
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export EDITOR="vim"
export N_PREFIX=$HOME/.n # n instead of nvm https://github.com/tj/n
export PATH=$N_PREFIX/bin:$PATH
export PATH=/usr/local/bin:$PATH # prioritise brews over system binaries

# Refer to https://carlosbecker.com/posts/speeding-up-zsh/
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $HOME/.zcompdump) ]; then
  compinit -d "$HOME/.zcompdump"
else
  compinit -d "$HOME/.zcompdump" -C
fi


# External dependencies
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=true
source "$DOTFILEADDONSDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"


# Prompt
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
eval "$(starship init zsh)"

# TODO: check in and see if this issue has been fixed https://github.com/starship/starship/issues/560