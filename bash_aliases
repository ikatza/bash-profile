alias cp='cp -iv'                           # careful and verbose
alias mv='mv -iv'                           # careful and verbose
alias mkdir='mkdir -pv'                     # create subdirs in necessary, verbose
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias folders='ll | grep ^d'
alias reload='source ~/.bash_profile'
# alias less='less -FSRXc'                    # Preferred 'less' implementation
alias les='less'                            # Sloppy typing
alias grep='grep --color=auto'              # colorful grep
# cd() { builtin cd "$@"; ll; }             # Always list directory contents upon 'cd'
alias ~="cd ~"                              # Go Home
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
# alias edit='subl'                         # edit: Opens any file in sublime editor
# alias c='clear'                           # c: Clear terminal display
alias whichs='type -all'                     # which: Find executables
alias path='echo -e ${PATH//:/\\n}'         # path: Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty: Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic: Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside
screenlog() { mkdir -p screenlogs && screen -U -L; }

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
        man $1 | grep -iC2 --color=always $2 | less
}

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' ; }


# OSX specific
if [[ $os == "Darwin" ]]; then
   alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
   trash () { command mv "$@" ~/.Trash ; }     # trash: Moves a file to the MacOS trash
   ql () { qlmanage -p "$*" >& /dev/null; }    # ql: Opens any file in MacOS Quicklook Preview
   alias DT='tee ~/Desktop/terminalOut.txt'    # DT: Pipe content to file on MacOS Desktop

fi

# alias py='python'
alias py='python3'
alias emacsclient=ec
alias emacst='emacs -nw'
alias h='history'
alias roo='root -l'
alias rooty='root -n -b -q'
alias clipy='xclip -sel clip'
alias dush='du -sh */*/* | sort -n | grep M'
alias ps2='ps -ef | grep -v $$ | grep -i '
alias Kinit='kdestroy -A ; kinit -Af -l 24h icaza@FNAL.GOV'
alias ssh-tunnel='ssh -N -L localhost:9999:localhost:9998 ' # maybe add -f to have run on background?
alias jupyter-tunnel='jupyter notebook --no-browser --port=9998'

alias g='git'

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g


#check alias when querying 'which'
# Doesn't work on Debian derived distros. Removing for now.
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

# alias ssh="~/.bash/try-mosh.sh $*"
