# Get itch.io's butler into our path
# if the exectuable exists
# https://itch.io/docs/butler/

if [[ -a $HOME/.config/itch/apps/butler ]]
then
    export PATH="$PATH:$HOME/.config/itch/apps/butler"
fi
