# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below

completion='/usr/share/zsh/site-functions/_git'

if test -f $completion
then
  source $completion
fi
