#!/bin/bash
#
# Install various bash and vim config files from github.com/sprngr/dotfiles
# Assumes you cloned to the .dotfiles directory at ~

__dotfiles_dir(){
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  echo $DIR
}

DOTFILES="$(__dotfiles_dir)"

# Bash config file
if [ $(uname) == 'Darwin' ]; then
  bash_config='.bash_profile' # OS X
else
  bash_config='.bashrc' # Assume everything else is Linux
fi

# Main installation function
main(){

  echo ">>> Installing dotfiles"

  if [ ! -d "~/.bin" ]; then
    echo ">>> Setting up ~/.bin directory"
    ln -s $DOTFILES/bin ~/.bin
  fi

  ln -s $DOTFILES/bash_config ~/${bash_config}

  echo ">>> Setting bash configuration at $bash_config"

  # Vim Config

  if command -v vim >/dev/null 2>&1; then
    ln -s $DOTFILES/vim ~/.vim
    ln -s $DOTFILES/vim/vimrc ~/.vimrc
    
    echo ">>> Setting up vim configuration"

    $(cd $DOTFILES && git submodule update --init)
    cd ~
  fi
  
  source ~/$bash_config

  echo ">>> Done"
}

# Check if a Bash configuration exists. If it does, exit.
if [ -e ~/${bash_config} ]; then
  echo ">>> Bash configuration already exists"
  echo ">>> Not going to risk borking existing settings, exiting"
else
  main
fi
