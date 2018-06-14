#!/bin/sh

source ~/.setenv

# Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Completion
source /usr/share/bash-completion/bash_completion
source /usr/share/bash-completion/completions/git
source /usr/share/bash-completion/completions/docker
source /etc/bash_completion.d/docker-compose

complete -cf sudo
complete -c man which

# Alias
source ~/.bash_aliases
