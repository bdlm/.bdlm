#!/usr/bin/env bash

# notify immediatly on background job completion
set -o notify

# locale
export LANG="en_US.UTF-8"

# editors
export VISUAL=vim
export EDITOR=vim

# history
export HISTSIZE="1000000"
export HISTTIMEFORMAT="%d/%m/%y %T: "
export HISTCONTROL=erasedups

# oracle
export ORACLE_HOME=/oracle/product/latest
export TNS_ADMIN=$HOME/.oracle/network/admin
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH

# perl
export PERLLIB=$PERLLIB:$HOME/perl
export PERL5LIB=$PERLLIB

# pager
export PAGER=less
export TERM='xterm-256color'
export LESS_IS_MORE=0

# cdpath
export CDPATH=:$HOME/src/github.com/mkenney:$HOME/src/github.com:$HOME

# platform specific
if [ "Darwin" = "$OS" ]; then
    export LESS="--quit-if-one-screen --ignore-case --status-column --quit-on-intr --LONG-PROMPT --silent --tilde --RAW-CONTROL-CHARS"
    if [ -f "$(brew --prefix)/bin/gls" ]; then
        # `brew install coreutils` to get gls
        eval $(gdircolors)
    else
        # bash 3 (os x default...) ls colors
        # http://www.marinamele.com/2014/05/customize-colors-of-your-terminal-in-mac-os-x.html
        export LSCOLORS="ExGxcxdxcxegedcbcdacad"
    fi

elif [ "Linux" = "$OS" ]; then
    export LESS="--quit-if-one-screen --ignore-case --status-column --quit-on-intr --LONG-PROMPT --silent --tilde --RAW-CONTROL-CHARS --mouse --save-marks"

elif [ "SunOS" = "$OS" ]; then
    export TERM=vt100
    export PAGER=more
fi
