export CLICOLOR=1
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
