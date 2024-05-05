# Dotfiles

These dotfiles can be _restowed_ using [GNU Stow](https://www.gnu.org/software/stow/), as well as _stowing_ new dotfiles.

## Setup

The following two commands can be used to _restow_ the dotfiles on a new machine.

```console
git clone https://github.com/6lr61/dotfiles.git ~/.dotfiles
make -C ~/.dotfiles
```

## Usage

To add new dotfiles first create a new _package_, i.e. a directory for a specific program in your `~/.dotfiles` folder, and move the config files into that directory.

```console
mkdir -p ~/.dotfiles/program
mv ~/.programrc ~/.dotfiles/program
```

Then use `stow` to create the symlinks in your home directory.

```console
stow --target=$HOME ~/.dotfiles/program
```
