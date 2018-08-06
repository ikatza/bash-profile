if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
export PATH='/its/home/id206/.linuxbrew/bin:/its/home/id206/.linuxbrew/sbin':"$PATH"

# test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"                                      
# test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH" 
# test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile   
# export PATH='/its/home/id206/.linuxbrew/bin:/its/home/id206/.linuxbrew/sbin':"$PATH" 

