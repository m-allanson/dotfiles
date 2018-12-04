# Source the dotfiles
for file in ~/.{prompt,aliases,exports,secrets} ~/gatsby-links.sh
do
	[ -r "$file" ] && . "$file"
done

# https://github.com/cantino/mcfly
if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
  source "$(brew --prefix)/opt/mcfly/mcfly.bash"
fi
