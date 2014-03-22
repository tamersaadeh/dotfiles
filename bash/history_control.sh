# Control history logging

# don't save command if it starts witha space
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

#let's have a really long history
HISTSIZE=5000
HISTFILESIZE=10000