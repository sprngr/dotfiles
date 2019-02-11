# Sets path for linuxbrew if necessary
if test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
    PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
fi