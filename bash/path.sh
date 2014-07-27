# Path

# source 
# Dotfile bins.
export PATH=~/.bin:$PATH

# So homebrew /usr/local/bin is preferrable to /usr/bin.
export PATH=/usr/local/bin:$PATH

# Ubuntu Ruby gem binaries
export PATH=/var/lib/gems/1.8/bin:$PATH

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# Conditional for Linux or Mac Java development
if [ uname == 'Darwin' ]; then

else
	JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
	export PATH=$PATH:$JAVA_HOME
fi