#!/bin/bash

# Bang Functions
# Author: sprngr
# Inspired by duckduckgo's !bang commands
# https://duckduckgo.com/bang.html

# Sadly I cannot use ! to start a function name ;_;


# defines what to use to open urls based on OS
if [ $(uname) == 'Darwin' ]; then
	alias _browser='open';
else
	alias _browser='xdg-open';
fi

# Todo: function to dump list of available bang functions
# possbily add some form of documentation listing
bang(){
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	echo $DIR
}

# @function g
# @site Google
# @url google.com
g() {
	query=$(echo $@ | tr '[:blank:]' '%20')
	_browser "https://encrypted.google.com/search?hl=en&q=$query"
}

# @function yt
# @site YouTube
# @url youtube.com
yt(){
	query=$(echo $@ | tr '[:blank:]' '+')
	_browser "https://youtube.com/results?search_query=$query"
}

# @function gh
# @site GitHub
# @url github.com
gh(){
	query=$(echo $@ | tr '[:blank:]' '+')
	_browser "https://github.com/search?q=$query"
}

# @function mdn
# @site Mozilla Developer Network
# @url developer.mozilla.org
mdn(){
	query=$(echo $@ | tr '[:blank:]' '+')
	_browser "https://developer.mozilla.org/en-US/search?q=$query"
}