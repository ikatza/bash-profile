#allow users to specify their own ~/.profile
if [ -f ~/.profile.`whoami` ]; then
    source ~/.profile.`whoami`
fi

#ensure our ssh-agent is running and that our keys are added
if [[ $os == "Linux" ]]; then
   eval `ssh-agent` > /dev/null
   keys=`ssh-add -l > /dev/null ; echo $?`
   if [[ $keys != "0" ]]; then
       ssh-add  >/dev/null 2>&1
   fi
elif [[ $os == "Darwin" ]]; then
     eval `/usr/bin/ssh-agent` > /dev/null
     keys=`/usr/bin/ssh-add -l > /dev/null ; echo $?`
     if [[ $keys != "0" ]]; then
        /usr/bin/ssh-add -K >/dev/null 2>&1
     fi
fi

#move on to .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
