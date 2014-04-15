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
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (⭠ \1$(parse_git_dirty))/"
}

_mktemp() {
    local tmpfile="${TMPDIR-/tmp}/psfile-$$"
    local bin="$(command -v mktemp || echo echo)"
    local file="$($bin "$tmpfile")"
    rm -f "$file"
    echo "$file"
}

PS_COUNT_FILE="$(_mktemp)"

ps_count_inc() {
    local PS_COUNT
    if [[ -f "$PS_COUNT_FILE" ]]; then
        let PS_COUNT=$(<"$PS_COUNT_FILE")+1
    else
        PS_COUNT=1
    fi

    echo $PS_COUNT | tee "$PS_COUNT_FILE"
}

ps_count_reset() {
    rm -f "$PS_COUNT_FILE"
}

case "$TERM" in
    xterm-256color | xterm | screen)
        [ "$(whoami)" == "root" ] &&  COLOR_CODE=31 || COLOR_CODE=32;
        PS1='$(ps_count_reset)${debian_chroot:+($debian_chroot)}\[\033[01;'$COLOR_CODE'm\]\[\033[00m\]\[\033[0;34m\]\w\[\033[00m\]$(parse_git_branch)
⟩⟩⟩ '
        PS2='$(ps_count_inc) ⟩ '
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
