# useful enviroment varibles

# Figure out the OS type
UNAME=`uname`

if [[ "$UNAME" == 'Darwin' ]]; then
    export OSX=1
elif [[ "$UNAME" == 'Linux' ]]; then
    export LINUX=1
    if [ ! -z "$__DOTFILES__/.installed/server" ]; then
        export SERVER=1
    fi
fi

# set nano as main terminal editor
export EDITOR='nano'