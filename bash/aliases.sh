#!/usr/bin/env bash

# tools
alias busy='while [ TRUE ]; do head -n 100 /dev/urandom; sleep .05; done | hexdump -C | grep --color=none "ca fe"'
alias grep='grep --color=auto'
alias less="less --quit-if-one-screen --ignore-case --status-column --quit-on-intr --LONG-PROMPT --silent --tilde --RAW-CONTROL-CHARS"
alias locate='locate -i'
alias pstree='pstree -ahlpuU'
alias rsync='rsync --progress'
alias sdot='source ~/.bashrc'
alias ls="ls -a"

# typos / shortcuts
alias a="cal"
alias cls='clear'
alias cp='cp -i'
alias csl='clear'
alias e='exit'
alias ed="emacs"
alias em="emacs"
alias iv='vim'
alias ivm='vim'
alias l='ls -1'
alias lcs='clear'
alias ll='ls -l'
alias ls='ls -aF --time-style=+"%a %Y-%m-%d %T" --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias suod='sudo'
alias top='htop -d 5'
alias vi='vim'
alias yes="echo no"

# platform specific
if [ "Linux" = "$OS" ]; then
    # add mouse input and marks
    alias less="less --mouse --save-marks"

elif [ "Darwin" = "$OS" ]; then
    # CPU temp
    alias cputemp='sudo powermetrics --samplers smc | egrep -i "(CPU die temperature)|(GPU die temperature)"'

    # use MacVim if available
    if [ ! -f "/Applications/MacVim.app/Contents/MacOS/Vim" ]; then
        echo "install MacVim for for an improved vim experience (that's twice the improvements!)";
    else
        alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
        alias vimdiff='/Applications/MacVim.app/Contents/bin/vimdiff'
    fi

    # brew tools
    which brew > /dev/null; e=$?
    if [ "0" != "$e" ]; then
        echo "install Homebrew for additional functionality";
        unalias ls
        alias ls='ls -aFG'
    else
        # openssh
        alias ssh='$(brew --prefix)/bin/ssh'

        # coreutils
        alias ls='gls -aF --time-style=+"%a %Y-%m-%d %T" --color=auto'
        alias realpath='grealpath'
    fi

elif [ "SunOS" = "$OS" ]; then
    unalias ls
    alias ls='ls -a'
fi
