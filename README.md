# Mike's dotfiles

A living package of my shell/OS configurations. Subject to change constantly (almost daily).

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
* script for homebrew to simplify starting services via launchctl, out of the box support for any formula which implements \#startup_plist.
	* Source: https://gist.github.com/jodosha/2365430


Feel free to use anything from it!

### How to Install

To install, clone it to a directory named `.dotfiles` in your home directory, then run `~/.dotfiles/install.sh`.
You can name it whatever, this is just the name I use.

```bash
$ git clone git@github.com:sprngr/dotfiles.git ~/.dotfiles
```

### Brew

For OS X we requrie `brew` for a lot of packages.

#### Installing brew

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
````

#### Brew packages

Current list of packages installed via `brew`:
* bash
* node
* openssl
* readline
* wget

#### Updating Bash

Since OS X doesn't come with the most recent build of `bash`, we add it ourselves from brew.

```bash
$ brew install bash
```

Then we need to find where `bash` lives

```bash
$ brew ls bash
```

We want the first line, at the time of writing it is `/usr/local/Cellar/bash/4.3.18/bin/bash`.

This then needs appended to the end of `/etc/shells` (requires sudo).

From there you need to change your default shell

```bash
$ chsh -s /usr/local/Cellar/bash/4.3.18/bin/bash $USER
```

Restart your terminal and bam, echo `$BASH_VERSION_MAJOR` to verify that it is greater than 3.

Congrats, you have installed a new `bash`.


