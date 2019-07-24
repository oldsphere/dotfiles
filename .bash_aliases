
alias cdp='pwd|xclip -selection s'
alias cdd='cd "xclip -o selection s`"'

alias t='tree -L 1'
alias tt='tree -L 2'

# Aliases for quick moving
alias qadd='ln -s `pwd` $HOME/quick'
qcd() {
    cd "$(readpath $1)"
}

# Bindings
bind '"\C-q": "qcd ~/quick/"'
bind '"\C-o": "&>/dev/null"'
