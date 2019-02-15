 #!/bin/bash

#this script will setup bash specifics using the configs in this repo

files="bash bash-git-prompt bash_profile bash_login bash_aliases bashrc profile profile.`whoami` bash_completion bash_logout screenrc"
date=`date +"%Y%m%d"`

mkdir -p -v  $HOME/screenlogs
if [ -d $HOME/screenlogs ]; then
    echo "Creating $HOME/screenlogs dir "
    mkdir -p $HOME/screenlogs
fi

for file in $files; do
    if [ -h ~/.$file ]; then
        unlink ~/.$file
    else
        if [ -f ~/.$file ]; then
            echo "backing up ~/.$file to ~/.$file.bak$date"
            mv ~/.$file ~/.$file.bak$date
        fi
    fi
    echo "symlinking $PWD/$file to ~/.$file"
    ln -s $PWD/$file ~/.$file
done


if [ -d ~/bin ]
	then cp bin/* ~/bin
else cp -r bin ~/bin
fi
