#!/bin/bash
# Functions

# Configuration Management

reload(){
	if [ -e ~/.bash_profile ]; then
		source ~/.bash_profile
	else
		source ~/.bashrc
	fi
	echo ">>> Reloading Bash Configuration"
}

# Utilities

# Allows me to easily jump to directories in my workspace
# Will become deprecated by standalone bash script w/ autocomplete
wk() { 
  cd ~/workspace/"$1"
}

# Create empty git repo w/ readme
# Will be deprecated by mkgit project
mkgit() { 
  mkdir "$1" && cd "$1" && echo "#$1" >> README.md
  git init && git add README.md
  git commit -m ">>> Initialized $1 repo with README.md"
}

# Simple math calculations
calc() { 
  echo "$*" | bc -l; 
}

# vidsearch() searches Youtube for the string inputted and returns a VLC
# playlist of the first page of results.
# Made from the script posted by herringonrye.
# Modified by sprngr for usage in OSX and Linux
# Requires wget (brew install wget)
vidsearch() {
  if [ $# -ne 1 ]
    then
    echo "Usage: vidsearch <search query>"
    echo "Note: the query may need to be in between quotation marks if it contains more than one word."
  fi

  if command -v vlc; then
    if [ uname == 'Darwin']; then
      wget -qO - "https://www.youtube.com/results?search_query=${1// /+}" | egrep -o "watch\?v=\S{11}" | uniq | sed -E 's/(.*)/http:\/\/youtube\.com\/\1/' | vlc -
    else
      wget -qO - "https://www.youtube.com/results?search_query=${1// /+}" | egrep -o "watch\?v=\S{11}" | uniq | sed -r 's/(.*)/http:\/\/youtube\.com\/\1/' | vlc -
    fi
  else
    echo "bash: vlc command not found"
    exit 1
  fi
}

# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.
# source https://github.com/henrik/dotfiles, modified for multiple OSes
o() {
  if [ $(uname) == 'Darwin' ]; then
    open ${@:-'.'}
  fi
}

# Create directory and cd to it.
# source https://github.com/henrik/dotfiles
mcd() {
  mkdir -p "$1" && cd "$1"
}

# The following are sourced from https://wiki.archlinux.org/index.php/Bash#Functions

# Extract any archive
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      rar x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
      esac
      else
        echo "'$1' is not a valid file"
      fi
}

# cd and ls in one
cl() {
  dir=$1
  if [[ -z "$dir" ]]; then
    dir=$HOME
  fi
  if [[ -d "$dir" ]]; then
    cd "$dir"
    ls
  else
    echo "bash: cl: '$dir': Directory not found"
  fi
}


# Automatically prepends branch name to commit
# Yells at you for using master
bcommit() {
  branch_name="$(_branch | tr '[:lower:]' '[:upper:]')"

  if [ $branch_name == 'MASTER' ]; then
    echo ">>> Current branch is master"
    echo ">>> Please move your changes to the appropriate branch"
    echo ">>> Aborting commit"
  else
    commit_message="$branch_name $@"

    git commit -am"$commit_message"
  fi
}

# Appends current branch to push, accepts argument for push destination
# TODO: Should be configured if not set, assume origin as default

bpush() {
  branch_name="$(_branch)"

  if [ $branch_name == 'master' ]; then
    echo ">>> Current branch is master"
    echo ">>> Please move your changes to the appropriate branch"
    echo ">>> Aborting commit"
  else
    git push $1 $branch_name
  fi
}

_branch(){
  git branch | grep ^\* | awk '{print $2}'
}

# Includes bang-functions.sh
source $DOTFILES/bash/lib/bang-functions.sh