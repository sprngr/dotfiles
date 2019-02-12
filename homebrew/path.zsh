# Sets path for linuxbrew if necessary
if test "$(uname)" = "Darwin"
then
    # Do nothing
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
  PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
fi
