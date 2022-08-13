#!/usr/bin/bash
kategori=" Apps\n Accesories\n Graphics\n Multimedia\n Systems\n Settings\n Editor\n Internet\n Logout"

selected=$(echo -e $kategori | wofi -l 1 -W 10% --dmenu -p "Find : " --line 9 --cache-file /dev/null -x 5 -y 5 | awk '{print tolower ($2)}')

applaunch () {
	wofi -Q $1 -l 1 -W 25% --line 8 -x 5 -y 5 
}

case $selected in
  apps)
    applaunch app;;
  accesories)
    applaunch tool;;
  graphics)
    applaunch Graphic;;
  multimedia)
    applaunch Audio;;
  systems)
    applaunch System;;
  settings)
    applaunch Setting;;
  editor)
    applaunch Text;;
  internet)
    applaunch Network;;
  logout)
    exec /home/ahmad/.local/bin/wofi-logoutv2.sh;; 
esac
