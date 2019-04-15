export CLICOLOR=1
export PS1='\[\033[01;33m\]\u@\h\[\033[01;31m\] \W\$\[\033[00m\] '
alias ll='ls -la'

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] \
    && . "/usr/local/etc/profile.d/bash_completion.sh"


###### pip completion ######
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip3


###### git completion ######
if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi
