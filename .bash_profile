# Load in all our bash settings

for file in ~/.{prompt,aliases,exports,extras}
do
	[ -r "$file" ] && . "$file"
done
unset file

# Enable brew git bash-completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
