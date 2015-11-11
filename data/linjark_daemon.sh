#!/bin/bash

# This script get various informations after various time who has passed

cd /tmp

touch autostart_working

ON_PI="no"

while true; do

# Housekeeping
sleep 1

if [ "$ON_PI" == "yes" ]
  then


ps cax | grep simond
if [ $? -ne 0 ]
  then

  killall simon
  simond &
  #ksimond &
  
 fi
ps cax | grep simon | grep Sl
if [ $? -ne 0 ]
  then

  simon &
  
 fi
 
 fi
###### Ende


##### WETTER
###################
if [ -f ~/.linjark/scripts/weather/linjark_weather ]
then


# timer 
if [ ! -f  ~/.linkark/.weather_update ] then
echo "timestampfile" > ~/.linkark/.weather_update
fi

if [ "$(( $(date +"%s") - $(stat -c "%Y" ~/.linkark/.weather_update) ))" -gt "7200" ]; then
   echo "is older then 2 hours"
   
   cd /tmp

GETCITY=$(cat ~/.linjark/scripts/weather/linjark_weather | grep MYCITY_URL= | tail -n1 | cut -d'"' -f2)
MYCITY=$(echo $GETCITY | sed 's/http\:\/\/www.wetter.de\/deutschland\///'| sed 's/.html//g')

  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-morgen.html -O wetterbericht-2.html &
  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-uebermorgen.html -O wetterbericht-3.html &
  wget http://www.wetter.de/deutschland/$MYCITY.html -O wetterbericht-00.html &
  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-aktuell.html -O wetterbericht-1.html &
  wget http://www.wetter.de/deutschland/$MYCITY/wetter-bericht.html -O wetterbericht-4.html &
  
  rm ~/.linkark/.weather_update
  
fi
  
 fi
 ##### Ende
###################
  
  
  
  
  
  
  
  
  
  
  
done