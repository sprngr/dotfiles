# Dotfiles (Michael Springer)

*nix enviornment configuration. A living package of my shell/OS configurations. Subject to change constantly (almost daily).

### Features
* vim configurations
	* if you're on linux, make sure `vim` is installed before running the installer
* bash aliases for everything
* way too many functions
* environment settings
* git completion
* custom prompt with awesome stuff
* a partial reimplementation of DuckDuckGo's Bang Commands
* a script that opens a random page to a lipsum generator
* scripts for homebrew service management <https://github.com/mitchellnemitz/bash-brew-service>


Feel free to use anything from it!

### How to Install

To install, clone it to a directory named `.dotfiles` in your home directory, then run `~/.dotfiles/install.sh`.
You can name it whatever, this is just the name I use.

```bash
$ git clone git@github.com:sprngr/dotfiles.git ~/.dotfiles
```

### Brew

For OS X we require `brew` & `brew-cask` for a lot of packages.

#### Installing brew

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
````

#### Installing brew-cask

```bash
$ brew install caskroom/cask/brew-cask
```

#### Brew packages

Current list of packages installed via `brew`:
* brew-cask
* node
* openssl
* readline
* wget

##### Updating Brew Packages

Anytime you need to update a package managed by `brew`, run the following:

```bash
$ brew update   # Updates brew's package listings
$ brew oudated  # Tells you what packages are outdated
$ brew upgrade  # Upgrades all packages installed
```

### OSX specific

Swap terminal package with [iTerm2](http://iterm2.com/).

For Mou we use the [base16](https://github.com/chriskempson/base16-mou) theme package.



