#!/usr/bin/env bash

echo -e "    $5                                                 \c"

# because MacVim is more better
if [ "Darwin" = "$OS" ] && [ -f "/Applications/MacVim.app/Contents/bin/vimdiff" ]; then
    /Applications/MacVim.app/Contents/bin/vimdiff -R "$2" "$5"
    exit $?
else
    vimdiff -R "$2" "$5"
    exit $?
fi
