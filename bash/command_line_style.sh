# Sets the style of a command line (PS1)

# get current git branch name
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# by default have a short time print
PS_SHORT_TIME=yes

# get current time
time_now(){
    if [ "$PS_SHORT_TIME" = yes ]; then
        date +[%H:%M]
    else
        date +[%H:%M:%S]
    fi
}

# changes PS_SHORT_TIME
toggle(){
    if [ "$PS_SHORT_TIME" = yes ]; then
        PS_SHORT_TIME=no
    else
        PS_SHORT_TIME=yes
    fi
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

source ~/.colors

# set PS1
PS1="\[$Red\]"'$(time_now)'" \[$Color_Reset\]${debian_chroot:+($debian_chroot)}\[$BGreen\]\u\[$Red\]@\[$BBlack\]\h\[$Yellow\]:\[$BBlue\]\w\[$BGreen\]"'$(parse_git_branch)'"\[$BBlue\]✈\[$Color_Reset\] "