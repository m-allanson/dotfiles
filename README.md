# dotfiles

My dotfiles for macOS.

## Getting started

### Clone repo

Clone this repo. Note the clone destination path. In this example I'll use `~/d/dotfiles`.

---

### Create `~/.zshenv`

Create the file `~/.zshenv`. You will set two env vars, one pointing to this repo, the other a location for zsh addons. For example:

```
ZDOTDIR=~/d/dotfiles
DOTFILEADDONSDIR=~/.zsh
```

---

### Create `~/.gitconfig`

Create the file `~/.gitconfig`. It should should point to the `.gitconfig` file in this repo. For example:

```
[include]
	path = ~/d/dotfiles/.gitconfig
```

---

### Install addons

Install any zsh addons to `$DOTFILEADDONSDIR`. In this example it's `~/.zsh`.

```
❯ ls ~/.zsh
drwxr-xr-x zsh-autosuggestions/
drwxr-xr-x zsh-nvm/
```

Review the `.zshrc` file for expected addons.

---

### Personal settings

In this repo you can optionally:

- create a `.personal` file for any non-public zsh settings.

- create a `.gitconfig.personal` file for any non-public git settings. For example:

```
[user]
	name = Foo Bar
	email = foo@example.com
[github]
	user = -username
	token = atokengoeshere
```

---

### Finish

Restart your shell or run `source ~/.zshrc` to apply the updates!

## Other dependencies

This `.zshrc` expects the following programs to be available:

- [jq](https://github.com/stedolan/jq)
- [caddy](https://github.com/caddyserver/caddy)
- [starship](https://starship.rs)

Ensure they are installed on your system.

## Benchmarking

You can run the following command to test startup time:

```
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
```

<details>
<summary>View my current numbers</summary>

```
❯ for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
        0.18 real         0.08 user         0.10 sys
        0.17 real         0.07 user         0.09 sys
        0.18 real         0.07 user         0.10 sys
        0.19 real         0.08 user         0.11 sys
        0.19 real         0.08 user         0.10 sys
        0.18 real         0.08 user         0.10 sys
        0.17 real         0.07 user         0.09 sys
        0.18 real         0.07 user         0.09 sys
        0.18 real         0.08 user         0.10 sys
        0.19 real         0.08 user         0.10 sys
```

</details>

## Resources

Inspired by (and often copied from) from various places, such as:

- https://carlosbecker.com/posts/speeding-up-zsh/
- https://scriptingosx.com/2019/06/moving-to-zsh/
- https://github.com/jedrichards/dotfiles
- http://dotfiles.github.com/
- https://github.com/mathiasbynens/dotfiles
