#!/bin/bash

# Bang Functions
# Author: sprngr
# Inspired by duckduckgo's !bang commands
# https://duckduckgo.com/bang.html

# Sadly I cannot use ! to start a function name ;_;
# We use : as a prefix instead so we do not accidentally impede upon any existing functions

# Todo:
# Finish out :bang
# Add urlencode
# Contemplate adding a :: function to directly hit ddg.com/q?=!$query
# Add Bang Functions:
# a, ng, git, gist, 

# defines what to use to open urls based on OS
if [ $(uname) == 'Darwin' ]; then
	alias _browser='open';
else
	alias _browser='xdg-open';
fi


# Documentation Template:

# @name Website Name
# @url website.url
# @define what does this do
# @type what kind of site is this
# @usage function <required> [optional]


# @name DuckDuckGo Bang
# @url ddg.com/q?=!
# @define Allows you to use DuckDuckGo any !bang not defined
# @type utility
# @usage :: <!bang> [query]
::(){
	query=$(echo $@ | tr '[:blank:]' '%20')
	_browser "https://duckduckgo.com/q?=!$query"
}

# Todo: function to dump list of available bang functions
# possbily add some form of documentation listing
# @name Bang
# @url none
# @define Prints out information for all of the avaiable bang functions
# @type utility
# @usage :bang
:bang(){
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	echo $DIR
}

# @name Google
# @url google.com
# @define Search Google
# @type search
# @usage :g [query]
:g() {
	query=$(echo $@ | tr '[:blank:]' '%20')
	_browser "https://encrypted.google.com/search?hl=en&q=$query"
}

# @name YouTube
# @url youtube.com
# @define Search YouTube
# @type video
# @usage :yt [query]
:yt(){
	query=$(echo $@ | tr '[:blank:]' '+')
	_browser "https://youtube.com/results?search_query=$query"
}

# @name GitHub
# @url github.com
# @define Search Github
# @type dev
# @usage :gh [query]
:gh(){
	query=$(echo $@ | tr '[:blank:]' '+')
	_browser "https://github.com/search?q=$query"
}

# @name Mozilla Developer Network
# @url developer.mozilla.org
# @define Search the Mozilla Developer Network
# @type dev
# @usage :mdn [query]
:mdn(){
	query=$(echo $@ | tr '[:blank:]' '+')
	_browser "https://developer.mozilla.org/en-US/search?q=$query"
} 