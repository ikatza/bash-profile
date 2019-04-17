# -*- mode: sh -*-

os=`uname -s`
whoami=`who | awk '{print $1}' | head -1`

if [ -f ~/.profile ]; then
    source ~/.profile
fi
