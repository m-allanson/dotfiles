# Load in all our bash settings

for file in ~/.{personal/.misc,personal/.git-config,prompt,aliases,functions,exports}
do
	[ -r "$file" ] && . "$file"
done
unset file

# Add git autocomplete: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi