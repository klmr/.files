# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi

# Not setting this causes vim errors with Unicode
export LANG=en_GB.UTF-8

# Some nice colours and a nice prompt
export CLICOLOR=cons25

# For `tree` etc.:
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35'

# git status in prompt, https://gist.github.com/2051095

_klmr_git() {
    git "$@" 2>/dev/null
}

_klmr_parse_git_dirty() {
    _klmr_git diff-index --quiet HEAD -- || echo "*"
}

_klmr_parse_git_branch() {
    local branch="$(_klmr_git symbolic-ref -q --short HEAD || _klmr_git rev-parse --short HEAD)"
    [[ ${#branch} -gt 0 ]] && echo " (⎇ $branch$(_klmr_parse_git_dirty))"
}

case "$TERM" in
    xterm-256color | xterm | screen-256color | screen)
        [ "$(whoami)" == "root" ] &&  COLOR_CODE=31 || COLOR_CODE=32;
        PS1='${PS_COUNT##*[$((PS_COUNT=0))-9]}${debian_chroot:+($debian_chroot)}\[\033[01;'$COLOR_CODE'm\]\[\033[00m\]\[\033[0;34m\]\w\[\033[00m\]$(_klmr_parse_git_branch)
⟩⟩⟩ '
        PS2='$((++PS_COUNT)) ⟩ '
        ;;
    *)
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        ;;
esac

# Set up commonly used applications

export EDITOR=nvim
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:l:pwd:exit:history'

# Import aliases etc.

for conf in ~/.config/shell/*.conf; do
    source "$conf"
done

# Import Bash completion

completion_file="$(brew --prefix 2> /dev/null)/share/bash-completion/bash_completion"
if [ -f "$completion_file" ]; then
    source "$completion_file"
fi

# Collect remaining paths

if [ -d /etc/paths.d ]; then
    for file in /etc/paths.d/*; do
        paths="$(< "$file" tr '\n' ':' | sed 's/:$//')"
        if [[ "$PATH" == '' ]]; then
            PATH="$paths"
        else
            PATH="$PATH:$paths"
        fi
    done

    export PATH
fi

# Manual override
export PATH="$HOME/bin:$PATH"
