# :shell: dotfiles

> *nix environment configuration

Part shareable collection, part living and growing personal configurations.

## Dependencies

### zsh

If you wish to utilize my dotfiles for your own, or you happen to be future me installing this once again - be sure to get `zsh` setup before continuing.

This is a nifty guide to [zsh installation instructions](https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e) across different systems.

## Install

Run this:

```sh
git clone https://github.com/sprngr/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

This setup supports a `~/.localrc` file for customizations you don't want to commit, such as specific environment variables that should not be exposed to the public.

## Issues/Fixes

### MacOS Catalina


If `compinit` issues pop up about insecure directories:

```shell
$ compaudit | xargs chmod g-w
```
[(Reference)](https://github.com/zsh-users/zsh-completions/issues/680#issuecomment-612960481)

## Acknowledgments

Very heavily inspired by [holman/dotfiles](https://github.com/holman/dotfiles), in fact I think at one point it had started as a fork of it - also includes work by many many others, so many I can't remember them all. Individual scripts I have borrowed will include attributions as well.

## License

[MIT](LICENSE), unless specified otherwise.
