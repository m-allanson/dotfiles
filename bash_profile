# Source the dotfiles
for file in ~/.{prompt,aliases,exports,secrets} ~/gatsby-links.sh
do
	[ -r "$file" ] && . "$file"
done
