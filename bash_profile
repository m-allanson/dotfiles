# Switched to zsh. Check zshrc for latest version of config.

# # Source the dotfiles
# # for file in ~/.{prompt,aliases,exports,secrets} ~/gatsby-links.sh
# # do
# # 	[ -r "$file" ] && . "$file"
# # done

# # https://github.com/cantino/mcfly
# if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
#   source "$(brew --prefix)/opt/mcfly/mcfly.bash"
# fi

# # heroku autocomplete
# HEROKU_AC_BASH_SETUP_PATH=/Users/mike/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# #
# #  ALIASES
# #-------------------------------------------------------------------------------

# # Nice ls
# #   -l Long format with details
# #   -A Almost all (include hidden, exclude . and ..)
# #   -h Human readable file sizes
# #   -G or --color-auto Colourise output on Linux and OSX
# #   -F Classify entries with one of the following types
# #     * Executable
# #     / Directory
# #     @ Symlink
# #     | Pipe
# #     = Socket
# alias ls="ls -GlAhF"

# # Cat Package.json Scripts
# alias cps="cat package.json | jq '.scripts'"

# #
# #  SECRETS
# #-------------------------------------------------------------------------------

# # Git config
# git config --global user.name "Mike Allanson"
# git config --global user.email "michael.allanson@gmail.com"
# git config --global github.user "m-allanson"
# git config --global github.token "0cb19d048cea1a9cfb17a1f472fe4e97"

# # Enable brew git bash-completion
# # https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   . $(brew --prefix)/etc/bash_completion
# fi

# # Spawn an HTTP server in the current directory
# function server {
#     caddy -host localhost browse gzip
# }

# #
# #  EXPORTS
# #-------------------------------------------------------------------------------

# # Make vim the default editor
# export EDITOR="vim"

# # Larger bash history (default is 500)
# export HISTSIZE=1000
# export HISTFILESIZE=$HISTSIZE

# # Don't put duplicate entries in the bash history
# export HISTCONTROL=ignoredups

# # Make some commands not show up in history
# export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# # Ensure coloured text on OSX
# export CLICOLOR=1

# # Give priority to brews over system binaries
# export PATH=/usr/local/bin:$PATH

# # Make sure global npm binaries are available
# export PATH=/usr/local/share/npm/bin:$PATH

# # Enable nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Go config
# # export GOPATH=$HOME/go
# # export PATH=$GOPATH/bin:$PATH

# # # AWS CLI autocompletion
# # complete -C '/usr/local/etc/bash_completion.d' aws

# # # point python to homebrew's python
# # # https://github.com/Homebrew/homebrew-core/issues/15746#issuecomment-316292316
# # export PATH=$(brew --prefix)/opt/python/libexec/bin:$PATH

# # Python virtual environments:
# # https://github.com/registerguard/registerguard.github.com/wiki/Install-python,-virtualenv,-virtualenvwrapper-in-a-brew-environment
# # export WORKON_HOME=$HOME/.virtualenvs
# # export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# # export PIP_VIRTUALENV_BASE=$WORKON_HOME
# # export PIP_RESPECT_VIRTUALENV=true
# # if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
# #     source /usr/local/bin/virtualenvwrapper.sh
# # else
# #     echo "WARNING: Can't find virtualenvwrapper.sh"
# # fi


# # pyenv
# # eval "$(pyenv init -)"

# # # virtual env wrapper config
# # export VIRTUALENVWRAPPER_PYTHON=/Users/mike/.pyenv/shims/python3
# # export WORKON_HOME=~/.virtualenvs
# # source /usr/local/bin/virtualenvwrapper.sh



# #
# #  PROMPT
# #-------------------------------------------------------------------------------

# # https://github.com/necolas/dotfiles

# prompt_git() {
#     local s=""
#     local branchName=""

#     # check if the current directory is in a git repository
#     if [ $(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?) == 0 ]; then

#         # check if the current directory is in .git before running git checks
#         if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

#             # ensure index is up to date
#             git update-index --really-refresh  -q &>/dev/null

#             # check for uncommitted changes in the index
#             if ! $(git diff --quiet --ignore-submodules --cached); then
#                 s="$s 🚧";
#             fi

#             # check for unstaged changes
#             if ! $(git diff-files --quiet --ignore-submodules --); then
#                 s="$s 💎";
#             fi

#             # check for untracked files
#             if [ -n "$(git ls-files --others --exclude-standard)" ]; then
#                 s="$s ❓";
#             fi

#             # check for stashed files
#             # if $(git rev-parse --verify refs/stash &>/dev/null); then
#             #     s="$s 💰";
#             # fi

#         fi

#         # get the short symbolic ref
#         # if HEAD isn't a symbolic ref, get the short SHA
#         # otherwise, just give up
#         branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
#                       git rev-parse --short HEAD 2> /dev/null || \
#                       printf "(unknown)")"

#         printf "%s" " ᚠ $1$branchName$s"
#     else
#         return
#     fi
# }

# # Show abbreviated pwd for longer paths
# # https://stackoverflow.com/questions/5687446/bash-custom-ps1-with-nice-working-directory-path#answer-33572866
# function generate_pwd {
#   pwd | sed s.$HOME.~.g | awk -F"/" '
#   BEGIN { ORS="/" }
#   END {
#   for (i=1; i<= NF; i++) {
#       if ((i == 1 && $1 != "") || i == NF-1 || i == NF) {
#         print $i
#       }
#       else if (i == 1 && $1 == "") {
#         print "/"$2
#         i++
#       }
#       else {
#         print ".."
#       }
#     }
#   }'
# }

# set_prompts() {
#     PS1="ᛝ \$(generate_pwd)\[\e[0;37m\]\$(prompt_git)\[\e[0m\]\n"
#     export PS1
# }

# set_prompts
# unset set_prompts

# # Homebrew shell autocompletion https://docs.brew.sh/Shell-Completion
# #if type brew 2&>/dev/null; then
# #  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
# #    source "$completion_file"
# #  done
# #fi

# # android debug
# #if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
# # export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
# #fi