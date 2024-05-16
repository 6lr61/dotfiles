PATH=$PATH:/home/learns/bin

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

COLUMN_LIMIT=80

# Check if we're using a terminal with colors
case "$TERM" in
    xterm-color|*-256color) COLOR_PROMPT="yes";;
esac

# Command history
HISTCONTROL=ignoreboth	# ignore spaces and duplicate commands
HISTSIZE=1000		# number of commands
HISTFILESIZE=2000	# number of lines in history file
shopt -s histappend	# append new commands to history file

# Window size
shopt -s checkwinsize	# check window size after each external command

# Man pages
MANWIDTH=$COLUMN_LIMIT

# Prompt
PS1="\[\033[1m\]\$\[\033[0m\] "

# Xterm title
case "$TERM" in
xterm*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

unset COLUMN_LIMIT
