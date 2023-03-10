#! /bin/bash  
if [ "$1" = 10 ]; then
  percent="1"
else
  percent="0.$1"
fi

#xrandr --output HDMI-1 --brightness "$percent" &&
xrandr --output eDP-1 --brightness "$percent"

if [ "$2" = night ]; then
  xrandr --output eDP-1 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent" 
 else

  xrandr --output eDP-1 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent" 
fi
