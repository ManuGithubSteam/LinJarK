#!/bin/bash

# This script get various informations after various time who has passed

cd /tmp

touch autostart_working

while true; do
sleep 1


if [ -f ~/.linjark/scripts/weather/linjark_weather ]
then

cd /tmp

GETCITY=$(cat ~/.linjark/scripts/weather/linjark_weather | grep MYCITY_URL= | tail -n1 | cut -d'"' -f2)
MYCITY=$(echo $GETCITY | sed 's/http\:\/\/www.wetter.de\/deutschland\///'| sed 's/.html//g')

  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-morgen.html -O wetterbericht-2.html &
  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-uebermorgen.html -O wetterbericht-3.html &
  wget http://www.wetter.de/deutschland/$MYCITY.html -O wetterbericht-00.html &
  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-aktuell.html -O wetterbericht-1.html &
  wget http://www.wetter.de/deutschland/$MYCITY/wetter-bericht.html -O wetterbericht-4.html &
  
 fi
 
 
  
   sleep 10m
  
done