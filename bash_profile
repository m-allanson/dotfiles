# Source the dotfiles
for file in ~/.{prompt,aliases,exports,secrets} ~/gatsby-links.sh
do
	[ -r "$file" ] && . "$file"
done

# https://github.com/cantino/mcfly
if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
  source "$(brew --prefix)/opt/mcfly/mcfly.bash"
fi

# heroku autocomplete
HEROKU_AC_BASH_SETUP_PATH=/Users/mike/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# Homebrew shell autocompletion https://docs.brew.sh/Shell-Completion
#if type brew 2&>/dev/null; then
#  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
#    source "$completion_file"
#  done
#fi

# android debug
#if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
# export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
#fi