if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

