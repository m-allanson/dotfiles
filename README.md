# dotfiles

My dotfiles for macOS, managed via [chezmoi](https://www.chezmoi.io).

## Requirements

- [homebrew](https://brew.sh)
- chezmoi (`brew install chezmoi`)

## Getting started

Create a copy of this repo at a default location. Run `chezmoi cd` to switch to the repo directory.

```
chezmoi init https://github.com/m-allanson/dotfiles.git
```

See what changes `chezmoi` will apply to your system:

```
chezmoi diff
```

Apply the changes:

```
chezmoi apply
```

Restart your shell to see any changes applied.

### Other `chezmoi` commands

See the [command overview](https://www.chezmoi.io/user-guide/command-overview/) for more details.

- `chezmoi cd` to switch to the chezmoi directory

- `chezmoi add <filepath>` to sync a file's state from the target dir back to chezmoi's source dir.

## Addons

NOTE: use brew install zsh-autosuggestions instead!

Review the `.zshrc` file for expected addons.

---

## Personal settings

Add the following files directly to your `$HOME` directory. They won't be version controlled, or managed by chezmoi, but will be sourced as part of the environment setup.

- A `.personal` file for any non-public zsh settings.

- A `.gitconfig.personal` file for any non-public git settings. For example:

```
[user]
	name = Foo Bar
	email = foo@example.com
[github]
	user = -username
	token = atokengoeshere
```

---

## Other dependencies

This `.zshrc` expects the following programs to be available:

- [jq](https://github.com/stedolan/jq)
- [volta](https://volta.sh/)
- [serve](https://github.com/vercel/serve)
- [starship](https://starship.rs)

Ensure they are installed on your system.

## Benchmarking

You can run the following command to test startup time:

```
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
```

<details>
<summary>View my current numbers</summary>

2022 numbers:

```
❯ for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
        0.07 real         0.04 user         0.02 sys
        0.05 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
        0.05 real         0.03 user         0.01 sys
```

Old numbers:

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

- https://www.jacobbolda.com/chezmoi-dotfile-management
- https://carlosbecker.com/posts/speeding-up-zsh/
- https://scriptingosx.com/2019/06/moving-to-zsh/
- https://github.com/jedrichards/dotfiles
- http://dotfiles.github.com/
- https://github.com/mathiasbynens/dotfiles

## TODO

- Check cross-platform handling for my setup
- Check out the `run_once` stuff and `brew bundle` to auto install homebrew packages. https://www.chezmoi.io/user-guide/machines/macos/

