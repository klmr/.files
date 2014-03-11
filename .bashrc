# Set up terminal

set -o vi

# Some nice colours and a nice prompt

export TERM=xterm-256color
export CLICOLOR=cons25

# For `tree` etc.:
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35'

# git status in prompt, https://gist.github.com/2051095

parse_git_dirty() {
    grep "^nothing to commit" \
        <(git status 2> /dev/null | tail -n1) > /dev/null || \
    echo "*"
}

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(⭠ \1$(parse_git_dirty))/"
}

case "$TERM" in
    xterm-256color | xterm | screen)
        [ "$(whoami)" == "root" ] &&  COLOR_CODE=31 || COLOR_CODE=32;
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;'$COLOR_CODE'm\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)
\$ '
        ;;
    *)
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        ;;
esac

# Set up commonly used applications

export EDITOR=vim

# Import aliases etc.

for conf in ~/.config/shell/*.conf; do
    source "$conf"
done

# Import Bash completion

if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi
