
alias cdp='pwd|xclip -selection s'
alias cdd='cd "xclip -o selection s`"'

alias t='tree -L 1'
alias tt='tree -L 2'

# Aliases for quick moving
alias qadd='ln -s `pwd` $HOME/quick'
qcd() {
    if [[ -h $1 ]];then
        cd "$(readlink $1)"
    else
        cd "$1"
    fi
}

# Bindings
bind '"\C-q": "qcd ~/quick/"'
bind '"\C-o": "&>/dev/null"'
