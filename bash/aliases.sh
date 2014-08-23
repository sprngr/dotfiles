#!/bin/bash
# Aliases

# Configuration Management
alias dotfiles='cd ~/.dotfiles'

# Git
# source https://github.com/henrik/dotfiles
alias g="git"
alias gs="git status"
alias gw="git show"
alias gw^="git show HEAD^"
alias gw^^="git show HEAD^^"
alias gd="git diff-index HEAD -p --color"  # What's changed? Both staged and unstaged.
alias gdo="git diff --cached"  # What's changed? Only staged (added) changes.
# for gco ("git commit only") and gca ("git commit all"), see functions.sh.
alias gcaf="git add --all && gcof"
alias gcof="git commit --no-verify -m"
alias gcac="gca Cleanup."
alias gcoc="gco Cleanup."
alias gcaw="gca Whitespace."
alias gpp='git pull --rebase && git push'
alias gppp="git push -u"  # Can't pull because you forgot to track? Run this.
alias gps='(git stash --include-untracked | grep -v "No local changes to save") && gpp && git stash pop || echo "Fail!"'
alias go="git checkout"
alias gb="git checkout -b"
alias got="git checkout -"
alias gom="git checkout master"
alias gr="git branch -d"
alias grr="git branch -D"
alias gcp="git cherry-pick"
alias gam="git commit --amend"
alias gamm="git add --all && git commit --amend -C HEAD"
alias gammf="gamm --no-verify"
alias gba="git rebase --abort"
alias gbc="git add -A && git rebase --continue"
alias gbm="git fetch origin master && git rebase origin/master"
alias gsu='git submodule update'

# Shell

# cd
alias ..='cd ..';
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'

# ls 
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # Mac OS X
fi

alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias l='ls -CF'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# New Commands 
# source https://wiki.archlinux.org/index.php/Bash#Aliases
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias pgg='ps -Af | grep'           # requires an argument

# Safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)

# Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

# Easter Eggs
alias fail='‎(ﾉಥ益ಥ）ﾉ﻿ ┻━┻'

# Linux Application launchers
if [ uname == 'Linux' ]; then
	alias teamspeak='~/apps/TeamSpeak3/ts3client_runscript.sh'
	alias idea='~/apps/idea/bin/idea.sh'
fi

# Mac Application launchers
if [ uname == 'Darwin' ]; then
	alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
	alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
fi