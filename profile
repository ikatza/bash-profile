# -*- mode: sh -*-

# don't load anything if you're connecting with tramp
if [[ $TERM = dumb ]]; then
    return
fi

#allow users to specify their own $HOME/.profile
if [ -f $HOME/.profile.$host.$who_am_i ]; then
    source $HOME/.profile.$host.$who_am_i
fi

# #ensure our ssh-agent is running and that our keys are added
# if [[ $os == "Linux" ]]; then
#    eval `ssh-agent` > /dev/null
#    keys=`ssh-add -l > /dev/null ; echo $?`
#    if [[ $keys != "0" ]]; then
#        ssh-add  >/dev/null 2>&1
#    fi
# elif [[ $os == "Darwin" ]]; then
#      eval `/usr/bin/ssh-agent` > /dev/null
#      keys=`/usr/bin/ssh-add -l > /dev/null ; echo $?`
#      if [[ $keys != "0" ]]; then
#         /usr/bin/ssh-add -K >/dev/null 2>&1
#      fi
# fi

#move on to .bashrc
if [ -f $HOME/.bashrc ]; then
    ##### TODO add guards like this [ -z "$SOME_VAR_SET_IN_BASHRC" ] && . $HOME/.bashrc
    source $HOME/.bashrc
fi

