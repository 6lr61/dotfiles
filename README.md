# Dotfiles

These dotfiles can be _restowed_ using [GNU Stow](https://www.gnu.org/software/stow/), as well as _stowing_ new dotfiles.

## Setup

To _restow_ the dotfiles on a new machine, first clone this repository and then run the makefile from that directory.

```console
git clone https://github.com/6lr61/dotfiles.git ~/.dotfiles
make -C ~/.dotfiles
```

## Usage

### Adding new dotfiles

First make a new _package_ by creating a directory for the specific program in the `~/.dotfiles` directory. Then move the config files into the newly created directory.

```console
mkdir -p ~/.dotfiles/program
mv ~/.programrc ~/.dotfiles/program
```

Then use `stow` to create the corresponding symlinks for the config files in your home directory.

```console
stow --target=$HOME ~/.dotfiles/program
```
