#!/bin/bash

wifi(){
      STATUS="X`/sbin/iwgetid`"
      if test "$STATUS" != "X" ; then
        #ESSID="`/sbin/iwgetid |awk -F ":" '{print $2}'|sed -e 's/"//g'`"
        ESSID="$(wicd-cli -d --wireless | grep Essid | sed -e 's/Essid: //')"
        #LINK="`awk '/wlp3s0:/ {print $3}' /proc/net/wireless |sed -e 's/\.//g'`"
        LINK="$(wicd-cli -d --wireless | grep Quality | sed -e 's/Quality: //')%"
      echo " $ESSID:$LINK"
      fi
} 

vol(){
    echo -e $(amixer -D pulse sget Master | grep -e 'Front Left:' | sed 's/[^\[]*\[\([0-9]\{1,3\}%\).*\(on\|off\).*/\2 \1/' | sed 's/off/M/' | sed 's/on //')
}

bat(){
    onl="$(grep "on-line" <(acpi -V))"
    charge="$(awk '{print +$4}' <(acpi -b))"
    remain="$(awk '{print $5}' <(acpi -b) | sed 's/...$//')"
    if [[ ( -z $onl && $charge -gt 20 ) ]]; then 
        echo -e "$charge% $remain"
    elif [[ ( -z $onl && $charge -le 20 ) ]]; then
        echo -e "$charge% $remain"
    else
        echo -e "$charge% $remain"
    fi
}

temp(){
       temp="$(acpi -t | awk '{print $4}' | sed 's/..$//')"
       echo -e "$temp°C"
}

dte(){
  dte1="$(date "+%d-%b-%y")"
  dte2="$(date "+%R:%S %Z")"
  echo -e "$dte1 $dte2"
}

caps(){
  CAPS_OFF="$(xset -q | grep "Caps Lock:   off")"
  if [ -z "$CAPS_OFF" ] ; then
    echo -e "CAPS |"
  fi
}

echo '{ "version": 1 }'
echo '['
echo '[]'
while :;
do
    status_string = "$(caps) $(wifi) | $(temp) | $(vol) | $(bat) | $(dte)"
    echo ",[{\"name\":\"time\",\"full_text\":\"$(caps) $(wifi) | $(temp) | $(vol) | $(bat) | $(dte)\"}]"
    sleep 1
done
#echo "$(caps) $(wifi) | $(temp) | $(vol) | $(bat) | $(dte)"

