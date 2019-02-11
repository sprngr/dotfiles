# Get itch.io's butler into our path
# if the exectuable exists
# https://itch.io/docs/butler/

if [[ -a ~/.config/itch/apps/butler/butler ]]
then
  export PATH="$PATH:~/.config/itch/apps/butler"
fi
