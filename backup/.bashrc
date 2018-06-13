#!/bin/sh

source ~/.setenv

# Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Completion
source /usr/share/bash-completion/completions/git

complete -cf sudo
complete -c man which

# Alias
source ~/.bash_aliases
