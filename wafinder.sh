#!/usr/bin/bash
kategori=$(cat $HOME/.config/wofi/kategori)

height=$(echo "$kategori" | wc -l)

selected=$(echo  "$kategori" | wofi -l 1 -W 10% --lines "$height" --dmenu -i -p "Switch to:" | awk '{print  ($1)}')

case $selected in
  Apps)
    wofi -Q app -l 1 -W 25%;;
  Accessories)
    wofi -Q tool -l 1 -W 25%;;
  Graphics)
    wofi -Q Graphic -l 1 -W 25%;;
  Multimedia)
    wofi -Q Audio -l 1 -W 25%;;
  Systems)
    wofi -Q System -l 1 -W 25%;;
  Settings)
    wofi -Q Setting -l 1 -W 25%;;
  Editor)
    wofi -Q Text -l 1 -W 25%;;
  Internet)
    wofi -Q Network -l 1 -W 25%;;
esac
