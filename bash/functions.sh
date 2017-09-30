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

function b64() {
  cat $1 | base64 | pbcopy;
}

# Allows me to easily jump to directories in my workspace
# Will become deprecated by standalone bash script w/ autocomplete
# Eventually
wk() {
  cd ~/workspace/"$1"
}

# Create empty git repo w/ readme
# Will be deprecated by mkgit project
mkgit() {
  mkdir "$1" && cd "$1" && echo "#$1" >> README.md
  git init && git add README.md
  git commit -m "Initialized $1 repo with README.md"
  echo ">>> Initialized $1 repo with README.md"
}

# Simple math calculations
calc() {
  echo "$*" | bc -l;
}

# OS X only:
# "o file.txt" = open file in default app.
# "o http://example.com" = open URL in default browser.
# "o" = open pwd in Finder.
# source https://github.com/henrik/dotfiles, modified for multiple OSes
o() {
  if [ $(uname) == 'Darwin' ]; then
    open ${@:-'.'}
  else
    xdg-open ${@:-'.'}
  fi
}

a() {
	atom ${@:-'.'}
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

# Returns the branch name as a string
# Restrict to use within other functions
__branch(){
  git branch | grep ^\* | awk '{print $2}' | tr -d '\n'
}

# Automatically prepends branch name to commit
# Yells at you for using master
commit() {
  branch_name="$(__branch | tr '[:lower:]' '[:upper:]')"

  if [ $branch_name == 'MASTER' ]; then
    echo ">>> Current branch is master"
    echo ">>> Please move your changes to the appropriate branch"
    echo ">>> Aborting commit"
  else
    commit_message="$branch_name $@"

    git commit -am "$commit_message"
  fi
}

# Inserts branch name into the push command, accepts first argument for push destination
push() {
  branch_name="`__branch`"

  if [ -n "$1" ]; then
    remote="origin"
  else
    remote="$1"
  fi

  if [ $branch_name == 'master' ]; then
    echo ">>> Current branch is master"
    echo ">>> Please move your changes to the appropriate branch"
    echo ">>> Aborting commit"
  else
    git push $remote $branch_name
  fi
}

# Copies branch name to clipboard
branch:copy(){
  branch_name=`__branch`;
  __branch | pbcopy
  echo "Copied '$branch_name' to the clipboard"
}
