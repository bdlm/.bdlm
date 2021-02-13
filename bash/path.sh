#!/usr/bin/env bash

# path
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$(go env GOROOT)/misc/wasm:$PATH
PATH=$HOME/.bdlmrc/bin:/usr/local/opt/openssl/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$GOPATH/bin:$PATH
if [ "Darwin" = "$OS" ]; then
    if [ -d ~/Library/Python/3.4/bin ]; then
        PATH=$PATH:~/Library/Python/3.4/bin
    fi

    # Python 3.4 on OS X
    if [ -d "/Library/Frameworks/Python.framework/Versions/3.4/bin" ]; then
        PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.4/bin
    fi
fi
export PATH
