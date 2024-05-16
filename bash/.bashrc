PATH=$PATH:/home/learns/bin

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
export MANWIDTH=80

# Less colors, for man
if [[ -n $COLOR_PROMPT ]]; then
    export GROFF_NO_SGR=1
    export LESS_TERMCAP_md=$'\e[1;96m'    # Bold
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[4;92m'    # Underlined
    export LESS_TERMCAP_ue=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[7m'    # Standout, reversed text
    export LESS_TERMCAP_se=$'\e[0m'
fi

# Prompt with git status
export GIT_PS1_SHOWDIRTYSTATE=1         # unstaged * and staged +
export GIT_PS1_SHOWUNTRACKEDFILES=1     # untracked %
export GIT_PS1_SHOWUPSTREAM="auto"      # behind <, ahead >, equal =

if [[ -n $COLOR_PROMPT ]]; then
    export GIT_PS1_SHOWCOLORHINTS=1
fi

PROMPT_COMMAND=prompt

prompt() {
    local EXIT="$?"
    if [[ $EXIT -eq 0 ]]; then
        unset STATUS
    else
        STATUS="$EXIT"
    fi
    
    if [[ -n $COLOR_PROMPT ]]; then
        PS1='${STATUS:+[\[\033[1;91m\]${STATUS}\[\033[0m\]]}'
        PS1+='$(__git_ps1 "(%s)")\[\033[1m\]\$\[\033[0m\] '
    else
        PS1='$(__git_ps1 "(%s)")\[\033[1m\]\$\[\033[0m\] '
    fi
}

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
