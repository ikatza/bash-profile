# -*- mode: sh -*-

export os=$(uname -s)
export who_am_i=$(whoami)
if [[ $(uname -s) == "Linux" ]]; then
    export host=$(hostname -d)
else
    export host=$(hostname -s)
fi

export BREW_WORKING=0

if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi

#include bin directory in users homedir
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin/:$PATH
fi
# if [ -d $HOME/Scripts ]; then
#     export PATH=$PATH:$HOME/Scripts
# fi
