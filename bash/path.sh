#!/bin/bash
# Path

# Local .bin dir
export PATH=~/.bin:$PATH

# So homebrew /usr/local/bin is preferrable to /usr/bin.
export PATH=/usr/local/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Node
export PATH=$HOME/.node/bin:$PATH

# Heroku Toolbelt
if [ -s "/usr/local/heroku/bin" ]; then
	export PATH=/usr/local/heroku/bin:$PATH
fi

if [ -s "$HOME/.rvm/scripts/rvm" ]; then 
	# RVM
	export PATH=$HOME/.rvm/bin:$PATH

	# RVM Ruby Gems
	export PATH=$HOME/.gems/bin:$PATH
fi

# Conditional for Linux or Mac development
if [ $(uname) == 'Darwin' ]; then
	JAVA_HOME=/usr/bin/java
	export PATH=$PATH:$JAVA_HOME
else
	# Ubuntu Ruby gem binaries
	export PATH=/var/lib/gems/1.8/bin:$PATH

	JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
	export PATH=$JAVA_HOME:$PATH
fi
