# dotfiles

My dotfiles for macOS.

Inspired by (and often copied from) from various places, such as:

- https://scriptingosx.com/2019/06/moving-to-zsh/
- https://github.com/jedrichards/dotfiles
- http://dotfiles.github.com/
- https://github.com/mathiasbynens/dotfiles

## Dependencies

For now dependencies are installed manually and expected to be in `~/.zsh/`. Refer to comments in the `./zshrc` file for dependency source locations.

Expected dependency locations:

- `~/.zsh/.zsh-better-npm-completion`
- `~/.zsh/.zsh-git-completion`
- `~/.zsh/.zsh-nvm`
- `~/.zsh/pure`

Note that you will need to manually keep dependencies up to date.

(TODO: investigate automating dependency installation and updates)

## Usage

- clone this repo
- ensure dependencies are installed (see previous section)
- run the publish script `./publish.sh`
- confirm the copy command for any files that are overwritten
- restart your shell or run `source ~/.zshrc` to apply the updates

### Secrets

The publish script will attempt to copy a file called `secrets` to `~/.secrets`. The `secrets` file is ignored from the repo. Use it to add any config that should not be committed to your repo.
