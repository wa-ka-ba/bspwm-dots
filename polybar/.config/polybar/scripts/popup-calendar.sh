#!/bin/sh

BAR_HEIGHT=22  # polybar height
BORDER_SIZE=3  # border size from your wm settings
YAD_WIDTH=222  # 222 is minimum possible value
YAD_HEIGHT=193 # 193 is minimum possible value
DATE="$(date +"%a  %H:%M,  %d %b")"

case "$1" in
--popup)


    yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
        --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx=1632 --posy=72 \
        --title="yad-calendar" --borders=0 >/dev/null &
    ;;
*)
    echo "$DATE"
    ;;
esac
