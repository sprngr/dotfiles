autoload colors && colors

# Colors: black|red|blue|green|yellow|magenta|cyan|white
local black=$fg[black]
local red=$fg[red]
local blue=$fg[blue]
local green=$fg[green]
local yellow=$fg[yellow]
local magenta=$fg[magenta]
local cyan=$fg[cyan]
local white=$fg[white]

local black_bold=$fg_bold[black]
local red_bold=$fg_bold[red]
local blue_bold=$fg_bold[blue]
local green_bold=$fg_bold[green]
local yellow_bold=$fg_bold[yellow]
local magenta_bold=$fg_bold[magenta]
local cyan_bold=$fg_bold[cyan]
local white_bold=$fg_bold[white]

local prompt_symbol='→'

directory_name() {
  current_dir="${PWD/#$HOME/~}"
  echo "[%{$blue_bold%}$current_dir%{$reset_color%}]"
}

prompt_indicator() {
  echo "%(?:%{$green_bold%}$prompt_symbol%{$reset_color%} :%{$red_bold%}$prompt_symbol%{$reset_color%} )"
}

# Git prompt magic
if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_prompt_info() {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "[%{$green_bold%}$(git_prompt_info)%{$reset_color%}]"
    else
      echo "[%{$red_bold%}$(git_prompt_info)%{$reset_color%}]"
    fi
  fi
}

# This assumes that you always have an origin named `origin`, and that you only
# care about one specific origin. If this is not the case, you might want to use
# `$git cherry -v @{upstream}` instead.
git_need_push() {
  if [ $($git rev-parse --is-inside-work-tree 2>/dev/null) ]
  then
    number=$($git cherry -v origin/$(git symbolic-ref --short HEAD) 2>/dev/null | wc -l | bc)

    if [[ $number == 0 ]]
    then
      echo " "
    else
      echo " %{$magenta_bold%}$number unpushed%{$reset_color%}"
    fi
  fi
}

# Git status indicators
GIT_PROMPT_ADDED="%{$green_bold%}+"
GIT_PROMPT_DELETED="%{$red_bold%}-"
GIT_PROMPT_MODIFIED="%{$magenta_bold%}*"
GIT_PROMPT_RENAMED="%{$blue_bold%}>"
GIT_PROMPT_UNMERGED="%{$cyan_bold%}="
GIT_PROMPT_UNTRACKED="%{$yellow_bold%}?"

# Get the status of the working tree
# Borrowed from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
git_prompt_status() {
  local INDEX STATUS
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$GIT_PROMPT_DELETED$STATUS"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$GIT_PROMPT_STASHED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    STATUS="$GIT_PROMPT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    STATUS="$GIT_PROMPT_BEHIND$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' &> /dev/null); then
    STATUS="$GIT_PROMPT_DIVERGED$STATUS"
  fi
  echo $STATUS
}

git_status() {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)"
        if [[ -n $git_status ]]; then
            git_status="[$git_status%{$reset_color%}]"
        fi
        echo $git_status
    fi
}

export PROMPT=$'$(directory_name)$(git_dirty)$(git_status)$(git_need_push)\n$(prompt_indicator)%u'
set_prompt() {
  export RPROMPT="%{$cyan%}%*%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
