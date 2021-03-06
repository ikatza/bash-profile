# -*- mode: sh -*-

# $HOME/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export LANG=en_US.UTF-8

export PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@$(hostname)|${PWD##*/}\007"'

export EDITOR="emacs -nw --quick"

export bpd="$HOME/Githubbies/bash-profile"
export BPD=$bpd
export gpd="$HOME/Githubbies/gitconfigs"
export GPD=$gpd

#set some easily callable variables for colors
Color_Off='\e[0m'       # Text Reset
### Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
### Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
### Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White
### Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White
### High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White
### Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White
### High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White


# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
HISTCONTROL=erasedups
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=$HOME/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
export LESSOPEN="|lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#######################################################
### start #############################################
### modifications to PS1 prompt. order is important ###
#######################################################
color_prompt=true

# PS1='\u@\h:\w'

#GNU Screen aware prompt
if [[ "$STY" ]] ; then
    if [[ "$color_prompt" ]]; then
        PS1='\u@\h[\[\e[34;1m\]$STY\[\e[0m\]]:\w'
    else
        PS1='\u@\h[$STY]:\w'
    fi
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Set screen window title
case "$TERM" in
screen)
    PROMPT_COMMAND='echo -ne "\033k${PWD#"${PWD%/*}/"}\\033\\"'
  ;;
esac

# GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized_UserHost_Icaza

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default $HOME/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=$HOME/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
[ -f $HOME/.bash-git-prompt/gitprompt.sh ] && source $HOME/.bash-git-prompt/gitprompt.sh


#######################################################
### end ###############################################
### modifications to PS1 prompt. order is important ###
#######################################################

#enable color support to ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# $HOME/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi
#load user specific aliases
if [ -f $HOME/.bash_aliases.$host.$who_am_i ]; then
    . $HOME/.bash_aliases.$host.$who_am_i
fi

#################################################################
### tab completion extentions. tab completion makes life good ###
#################################################################
if [[ $BREW_WORKING == 0 ]] ; then
  if type brew &>/dev/null; then
    brewPrefix=`brew --prefix`
    export BASH_COMPLETION_COMPAT_DIR="$brewPrefix/etc/bash_completion.d"
    [[ -r "$brewPrefix/etc/profile.d/bash_completion.sh" ]] && . "$brewPrefix/etc/profile.d/bash_completion.sh"

    for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
    do
      [[ -f $COMPLETION ]] && source "$COMPLETION" &>/dev/null
    done
    if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
    then
      source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
    fi
  fi
fi

#########################################
### start ###############################
### ssh related stuff, like ssh-agent ###
#########################################

# ssh agent not working

#########################################
### end #################################
### ssh related stuff, like ssh-agent ###
#########################################

# run logout script, even for non-login shells
trap_exit() {
    . "$HOME/.bash_logout"
}
trap trap_exit EXIT

#after loading everything that is generic to our environment, load user specifc stuff
[ -f $HOME/.bashrc.$who_am_i ] && . $HOME/.bashrc.$who_am_i
