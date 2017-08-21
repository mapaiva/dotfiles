# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Custom PS1
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[\033[38;5;248m\] \$(parse_git_branch)\n\[$(tput sgr0)\]\[\033[38;5;171m\]❯\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Go Environment
export GOPATH=/home/mapaiva/go
export GOROOT=/usr/local/go
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/local/go/bin:/home/mapaiva/go/bin
    
# Aliases
alias vim='nvim'

