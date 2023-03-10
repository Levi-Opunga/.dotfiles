#! /bin/bash  

CurrBright=$( xrandr --verbose --current | grep "eDP-1" -A5 | tail -n1 )
CurrBright="${CurrBright##* }"

if [ $CurrBright = 1.1 ]; then
if [ $1 = + ]; then
   echo "Maximum Value"
else
  percent=`echo $CurrBright - .1 | bc`
fi

else
if [ $1 = + ]; then
percent=`echo $CurrBright + .1 | bc`
else
  percent=`echo $CurrBright - .1 | bc`
fi
fi


xrandr --output HDMI-1 --brightness "$percent" && xrandr --output eDP-1 --brightness "$percent"

if [ "$2" = night ]; then
  xrandr --output eDP-1 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent" 
else

  xrandr --output eDP-1 --brightness "$percent" && xrandr --output HDMI-1 --brightness "$percent" 
fi
