#!/usr/bin/bash
kategori=" Apps\n Accesories\n Graphics\n Multimedia\n Systems\n Settings\n Editor\n Internet"

selected=$(echo -e $kategori | wofi -l 1 -W 10% --dmenu -p "Switch to:" --line 8 --cache-file /dev/null  | awk '{print tolower ($2)}')

case $selected in
  apps)
    exec wofi -Q app -l 1 -W 25% --line 8;;
  accesories)
    exec wofi -Q tool -l 1 -W 25% --line 8;;
  graphics)
    exec wofi -Q Graphic -l 1 -W 25% --line 8;;
  multimedia)
    exec wofi -Q Audio -l 1 -W 25% --line 8;;
  systems)
    exec wofi -Q System -l 1 -W 25% --line 8;;
  settings)
    exec wofi -Q Setting -l 1 -W 25% --line 8;;
  editor)
    exec wofi -Q Text -l 1 -W 25% --line 8;;
  internet)
    exec wofi -Q Network -l 1 -W 25% --line 8;;
esac
