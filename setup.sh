#!/bin/bash

#this script will setup bash specifics using the configs in this repo

os=$(uname -s)
who_am_i=$(whoami)
if [[ $(uname -s) == "Linux" ]]; then
    host=$(hostname -d)
else
    host=$(hostname -s)
fi


files="bash-git-prompt bash_profile bash_login bash_aliases bash_aliases.$host.$who_am_i bashrc profile profile.$host.$who_am_i bash_completion bash_logout screenrc tigrc latexmkrc"
date=`date +"%Y%m%d"`

mkdir -p -v  $HOME/screenlogs
if [ -d $HOME/screenlogs ]; then
    echo "Creating $HOME/screenlogs dir "
    mkdir -p $HOME/screenlogs
fi

for file in $files; do
    if [ -h $HOME/.$file ]; then
        unlink $HOME/.$file
    else
        if [ -f $HOME/.$file ]; then
            echo "backing up $HOME/.$file to $HOME/.$file.bak$date"
            mv $HOME/.$file $HOME/.$file.bak$date
        fi
    fi
    echo "symlinking $PWD/$file to $HOME/.$file"
    ln -s $PWD/$file $HOME/.$file
done


if [ -d $HOME/bin ]; then
    cp bin/* $HOME/bin
else cp -r bin $HOME/bin
fi
