#!/bin/bash
# Path

# Local .bin dir
export PATH=~/.bin:$PATH

# So homebrew /usr/local/bin is preferrable to /usr/bin.
export PATH=/usr/local/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

if [ -s "$HOME/.rvm/scripts/rvm" ]; then 
	# RVM
	export PATH=$HOME/.rvm/bin:$PATH

	# RVM Ruby Gems

	export PATH=$HOME/.gems/bin:$PATH

fi

# Conditional for Linux or Mac development
if [ uname == 'Darwin' ]; then
	#Update when we do JDK stuffs
	#JAVA_HOME=
	export PATH=$PATH #:$JAVA_HOME
else
	# Ubuntu Ruby gem binaries
	export PATH=/var/lib/gems/1.8/bin:$PATH

	JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
	export PATH=$JAVA_HOME:$PATH
fi