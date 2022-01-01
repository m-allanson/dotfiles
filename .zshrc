#  Aliases
alias ls="ls -GlAhF"
alias cps="jq '.scripts' package.json" # list scripts from package.json
alias m="smerge"
alias s="serve" # quick web server https://github.com/vercel/serve
alias c="code"
alias k="kubectl"
alias mp="multipass"
# Tail Portal Manager. TODO: This runs on every shell startup, which is slow and means you need a new shell whenever the pod id changes. Should execute only on invocation
# alias tpm="k logs -n storageos $(kubectl get pod -n storageos -o=jsonpath='{range .items..metadata}{.name}{"\n"}{end}' | grep 'portal-manager') -f manager | jq"


# Personal settings
source "$ZDOTDIR/.personal"

echo $HOME

# Misc
setopt HIST_IGNORE_DUPS
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export EDITOR="vim"

# prioritise brews over system binaries
export PATH=/usr/local/bin:$PATH 

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# sublime text / merge
export PATH="/Applications/Sublime Merge.app/Contents/SharedSupport/bin/:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# gcloud autocompletions
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

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

# rust
source "$HOME/.cargo/env"

# Prompt
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
eval "$(starship init zsh)"

# Old. Can probably remove the following lines

# Heroku autocompletions
# HEROKU_AC_ZSH_SETUP_PATH=/Users/mike/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Disable telemetry for SAM CLI
# export SAM_CLI_TELEMETRY=0

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/mike/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/mike/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/completion.zsh.inc'; fi


# tabtab source for various packages. sls and serverless last time I looked
# uninstall by removing these lines
# [[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true


# TODO: check in and see if this issue has been fixed https://github.com/starship/starship/issues/560