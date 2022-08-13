#!/usr/bin/bash
menu=" Shutdown\n Restart\n Logout\n Cancel"

selected=$(echo -e $menu | wofi -W 10% --dmenu --line 4 --cache-file /dev/null -p "Wofi Logout" | awk '{print tolower ($2)}')

shutdown () {
	pilih="Yes\nNo\nBack"
	
	selected=$(echo -e $pilih | wofi -W 10% --dmenu --line 3 --cache-file /dev/null -p "Shutdown ?" | awk '{print tolower ($1)}')
	
	case $selected in
	   yes)
	      exec systemctl poweroff;;
	   no)
	      exec killall wofi;;
	   back)
	      $0;;
	esac
}

reboot () {
	pilih="Yes\nNo\nBack"
	
	selected=$(echo -e $pilih | wofi -W 10% --dmenu --line 3 --cache-file /dev/null -p "Shutdown ?" | awk '{print tolower ($1)}')
	
	case $selected in
	   yes)
	      exec systemctl reboot;;
	   no)
	      exec killall wofi;;
	   back)
	      $0;;
	esac
}

killwaycomp () {
	if pgrep -x "dwl" > /dev/null; then
		killall dwl
	elif pgrep -x "sway" > /dev/null; then
		killall sway
	elif pgrep -x "labwc" > /dev/null; then
		killall labwc
	elif pgrep -x "hikari" > /dev/null; then
		killall hikari
	fi
}

log_out () {
	pilih="Yes\nNo\nBack"
	
	selected=$(echo -e $pilih | wofi -W 10% --dmenu --line 3 --cache-file /dev/null -p "Logout Wayland ?" | awk '{print tolower ($1)}')
	
	case $selected in
	   yes)
	      killwaycomp;;
	   no)
	      exec killall wofi;;
	   back)
	      $0;;
	esac
}

case $selected in
   shutdown)
      shutdown;;
   restart)
      reboot;;
   logout)
      log_out;;
   cancel)
      exec killall wofi;;
esac
