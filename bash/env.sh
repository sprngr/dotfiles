#!/bin/bash
# Environment

if [ -s "$HOME/.rvm/scripts/rvm" ]; then 
	# Unsetting GEM_HOME
	unset GEM_HOME
fi

# Set vim as our default editor in the terminal
export EDITOR='vim'

# Store the major version for bash because we need it later
export BASH_VERSION_MAJOR=`echo $BASH_VERSION | awk 'BEGIN { FS = "." } ; { print $1 }'`

# don't duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length
HISTSIZE=1000
HISFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories
if [ $BASH_VERSION_MAJOR -gt 3 ]; then
	shopt -s globstar
fi