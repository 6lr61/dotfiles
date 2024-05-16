if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc;
fi

if [[ -n $COLOR_PROMPT ]]; then
    PS1="\[\033[01;32m\]\h\[\033[0m\]$PS1"
else
    PS1="\h${PS1}"
fi
