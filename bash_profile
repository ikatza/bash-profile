# -*- mode: sh -*-

os=`uname -s`
whoami=`who | awk '{print $1}' | head -1`

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
