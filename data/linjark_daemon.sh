#!/bin/bash

# This script get various informations after various time who has passed

cd /tmp

touch autostart_working

ON_PI="no"
MARYPATH="$HOME/.linjark/"
Sleeptime_marry=10

while true; do

# Housekeeping
sleep 1
echo "linjark daemon working...."

if [ "$ON_PI" == "yes" ]
  then
  
Sleeptime_marry=30

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
 
 fi # ende pi
 
ps cax | grep marytts-server &> /dev/null
if [ $? -ne 0 ]
  then
  cd $MARYPATH
echo "start mary"
# this can take 7!!! seconds!! JAVA is SLOW!!!
./start_marry.sh &
sleep $Sleeptime_marry &
fi 
 
###### Ende


##### WETTER
###################
if [ -f ~/.linjark/scripts/weather/linjark_weather ]
then


# timer 
if [ ! -f  ~/.linjark/.weather_update ] 

then
echo "timestampfile" >> ~/.linjark/.weather_update
fi

nowTime=$(date +"%s")
creationTime=$(stat -c "%Y" ~/.linjark/.weather_update)
count=$(expr $nowTime  - $creationTime)

# 3 hours
waitTime=10800 #seconds

if [ "$count" -gt "$waitTime" ]; 
then
   echo "is older then 2 hours"
   
   cd /tmp

GETCITY=$(cat ~/.linjark/scripts/weather/linjark_weather | grep MYCITY_URL= | tail -n1 | cut -d'"' -f2)
MYCITY=$(echo $GETCITY | sed 's/http\:\/\/www.wetter.de\/deutschland\///'| sed 's/.html//g')

  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-morgen.html -O wetterbericht-2.html 
  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-uebermorgen.html -O wetterbericht-3.html 
  wget http://www.wetter.de/deutschland/$MYCITY.html -O wetterbericht-00.html 
  wget http://www.wetter.de/deutschland/$MYCITY/wetterbericht-aktuell.html -O wetterbericht-1.html 
  wget http://www.wetter.de/deutschland/$MYCITY/wetter-bericht.html -O wetterbericht-4.html 
  
  for i in 1 2 3 4; do

# wetter generell zb regnerisch
cat wetterbericht-00.html |  awk '/forecast-day-text/,/<\/div>/' | cut -d"<" -f1 | sed 's/<[^>]\+>/ /g' | sed -e 's/^[ \t]*//' | sed '/^$/d'  | cut -d"," -f1 | sed s'/Es wird //'g | sed -n "$i"p> weatherfile-$i

# max / min 
cat wetterbericht-$i.html | grep wt-color-temperature-max | sed 's/<[^>]\+>/ /g' | sed -e 's/^[ \t]*//' | sed 's/&deg;/ Grad/g' | head -n 1  >> weatherfile-$i

# gefühlte temp
cat wetterbericht-$i.html | grep gefühlt: | head -n 1 | sed 's/<[^>]\+>/ /g' | sed -e 's/^[ \t]*//' | cut -f2 -d "(" | cut -f1 -d ")" | sed 's/°/ Grad/g' | cut -d ":" -f2 | sed -e 's/^[ \t]*//' >> weatherfile-$i

# Sonnenstunden
cat wetterbericht-00.html |  awk '/forecast-day-text/,/<\/div>/' | cut -d"<" -f1 | sed 's/<[^>]\+>/ /g' | sed -e 's/^[ \t]*//' | sed '/^$/d'  | cut -d"," -f2- | sed s'/ dabei gibt es //' | sed -n "$i"p >> weatherfile-$i

# Regenrisiko
cat wetterbericht-$i.html | grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | head -n 63 | grep % | head -n 20 | tail -n 2 | head -n 1 | sed 's/^/Regenrisiko:\ /' | sed 's/%/ Prozent/g' >> weatherfile-$i 

cat wetterbericht-$i.html | grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | head -n 63 | tail -n 1 |  sed 's/^/Regenrisiko:\ /' | sed 's/%/ Prozent/g'>> weatherfile-$i

# niederschlag in Litern 
cat wetterbericht-$i.html | grep "l/m" |  grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | tail -n 1 | sed 's/l/Liter pro Quadratmeter/g'|sed 's/-/ bis /g'| sed 's/≥ //g' | sed 's/<//g' | sed 's/>//g' | sed 's/≤ //g' >> weatherfile-$i

# Luftfeuchtigkeit
cat wetterbericht-$i.html | grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | grep % | tail -n 1 | sed 's/%/ Prozent/g'| sed 's/^/Luftfeuchtigkeit:\ /'>> weatherfile-$i

# Luftdruck
cat wetterbericht-$i.html | grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | tail -n 2 | head -n 1 | sed 's/hP/hektopaskal /' >> weatherfile-$i

# winstärke
Wind1=$(cat wetterbericht-$i.html | grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | grep "(" | head -n 26 | tail -n 2 | sed '0,/(/s//Windstärke von /' | sed 's/(/bis /g' | sed 's/km/ kilometer pro Stunde/g' | head -n 1) 
Wind2=$(cat wetterbericht-$i.html | grep -Po '(?<=<span class="wt-font-semibold">)([^</span>]*)' | grep "(" | head -n 26 | tail -n 2 | sed '0,/(/s//Windstärke von /' | sed 's/(/bis /g' | sed 's/km/ kilometer pro Stunde/g' | tail -n 1)
Wind="$Wind1 $Wind2"
echo $Wind >> weatherfile-$i

#Mondphase
cat wetterbericht-$i.html | grep wt-font-semibold | tail -n 3 | head -n 1 | sed 's/<[^>]\+>/ /g' | sed -e 's/^[ \t]*//' >> weatherfile-$i

# Pollenvorhersage
# Nicht getestet! 11/2015
cat wetterbericht-$i.html | grep Pollenvor | sed -e 's/^[ \t]*//' | cut -f5 -d "=" | sed 's/"//g' | sed 's/>//' >> weatherfile-$i
cat wetterbericht-$i.html | grep Pollenvor
status=$?
    if [ $status -eq 1 ]; then
        echo "Es gibt keinen Pollenflug Sir" >> weatherfile-$i  # wenn keine Pollenvorhersage gefunden wurde
    fi

# Pollenart
    if [ $status -eq 1 ]; then
        echo ".+.+.+">> weatherfile-$i  # wenn keine Pollenvorhersage gefunden 
         PollenArt=""
        else
        cat wetterbericht-$i.html | grep wt-font-semibold | tail -n 10 | head -n 1 | sed 's/<[^>]\+>/ /g' | sed -e 's/^[ \t]*//' >> weatherfile-$i
    fi


# Unwetter UnwetterWarnung
# nicht getestet! 11/2015
# CitName=$(echo $MYCITY | cut -f2 -d "-")
#   
#  UnwetterWarnung="Achtung $MASTER! Es liegt eine UnwetterWarnung vor! Vor extremem Unwetter in $CitName wird gewarnt!"
#   
#  cat wetterbericht-$i.html | grep Unwetterwa
#  status=$?
#     if [ $status -ne 0 ]; then
#         UnwetterWarnung="" # wenn keine UnwetterWarnung gefunden wurde mit cat lösche text
#     fi
 
 UnwetterWarnung=" "
 ######################################
 #######################################
 
 done # weather-file
 
 MASTER="Sir"
 MASTER=$(cat ~/.linjark/gender)
 
 cd /tmp
 
 for dayvar in 1 2 3 4; do
 
 echo $dayvar
 LuftF_Roh=$(cat weatherfile-"$dayvar"| sed -n 8p| sed 's/:/\%3A/' )
 Pollen=$(cat weatherfile-"$dayvar" | sed -n 12p)
 if [ "$Pollen" == "Es gibt keinen Pollenflug Sir" ]
 then
 PollenArt=""
else
PollenArt=$(cat weatherfile-"$dayvar" | sed -n 13p | sed 's/^/Pollenart\%3A /' )
fi
 
 #echo $PollenArt
 
 Niedersch=$(cat weatherfile-"$dayvar" | grep Quadratmeter | sed 's/^/Niederschlag\%3A /')
   LuftDr_ROh=$(cat weatherfile-"$dayvar" | sed -n 9p| sed 's/^/Luftdruck\%3A /')
  SonnenSt_ROh=$(cat weatherfile-"$dayvar" | sed -n 4p | sed 's/:/,/g' | sed 's/00/0/g')
  RegenRis_ROh=$(cat weatherfile-"$dayvar"| sed -n 5p| sed 's/:/\%3A/')
  Wetter_ROh=$(head -n 1 weatherfile-"$dayvar" | sed 's/^/Das Wetter wird XDE /' )
  TempMAX=$(cat weatherfile-"$dayvar" | sed -n 2p | sed 's/^/die Maximale Temperatur des Tages beträgt\%3A /' | cut -d"/" -f1)
  TempMIN=$(cat weatherfile-"$dayvar" | sed -n 2p | sed 's/-/ minus /'g  | cut -d"/" -f2 | sed 's/^/Die minimale Temperatur des Tages beträgt\%3A /')
  GefTemp=$(cat weatherfile-"$dayvar" | sed -n 3p |  sed 's/^/temperatur gefühlt\%3A /g' )
  Wind=$( cat weatherfile-"$dayvar" | sed -n 10p )
  Mond=$(cat weatherfile-"$dayvar" | sed -n 11p | sed 's/^/Mondphase\%3A /')
  
  
  dateThen=$(date --date="3 day" +%A)
  
  if [ $dayvar == 2 ]; then
    Wetter_ROh=$(echo $Wetter_ROh | sed 's/XDE/morgen/g' )
  fi
  if [ $dayvar == 3 ]; then
    dateThen=$(date --date="2 day" +%A)
    dateThen2=" , am $dateThen , "
    Wetter_ROh=$(echo $Wetter_ROh | sed "s/XDE/übermorgen$dateThen2/g" )
  fi
  if [ $dayvar == 4 ]; then
    dateThen=$(date --date="3 day" +%A)
    dateThen2=" , am $dateThen , "
    Wetter_ROh=$(echo $Wetter_ROh | sed "s/XDE/in drei Tagen$dateThen2/g" )
  fi
  if [ $dayvar == 1 ]; then
    Wetter_ROh=$(echo $Wetter_ROh | sed 's/XDE/heute/g' )
  fi
  #echo ""
  witzig1="Es gibt kein schlechtes Wetter, es gibt nur falsche Kleidung. "
  witzig2="Montagswetter wird nicht Wochen alt. "
  witzig3="Zu den unangenehmsten Klimazonen zählen die MisanThROPEN."
  witzig4="Der Weise äußert sich vorsichtig, der Narr mit Bestimmtheit über das kommende Wetter."
  
  rand=$(echo $(( RANDOM % 60 + 1 )))
  #echo $rand
  witz=""
  if [ $rand -gt 20 ]; then
    witz=$witzig1
  elif  [ $rand -gt 30 ]; then
    witz=$witzig2
  elif  [ $rand -gt 40 ]; then
    witz=$witzig3
  elif  [ $rand -gt 50 ]; then
    witz=$witzig4
  else
    witz=""
  fi
  
  Wetter_ROh="$Wetter_ROh$MASTER"
  STOP=",+,+.+"
  
   for artvar in e l s a m p; do
   
  if [ $artvar == "e" ]; then
  echo "inside"
  say="$UnwetterWarnung$STOP$Wetter_ROh$STOP$TempMIN$STOP$TempMAX$STOP$GefTemp$STOP$SonnenSt_ROh$STOP$RegenRis_ROh$STOP$Niedersch$STOP$Wind$STOP$LuftF_Roh$STOP$LuftDr_ROh$STOP$Pollen$STOP$PollenArt$STOP$Mond$STOP$witz"
  fi
  if [ $artvar  == "l" ]; then
  say="$UnwetterWarnung$STOP$Wetter_ROh$STOP$RegenRis_ROh$STOP$TempMIN$STOP$TempMAX$STOP$GefTemp"
  fi
  if [ $artvar == "s" ]; then
  say="$UnwetterWarnung$STOP$Wetter_ROh$STOP$GefTemp"
  #say="$UnwetterWarnung+$GefTemp"
  fi
  if [ $artvar == "a" ]; then
  say="$Wind$STOP$LuftF_Roh$STOP$LuftDr_ROh$STOP"
  fi
  if [ $artvar == "m" ]; then
  say="$STOP$Mond$STOP"
  fi
  if [ $artvar == "p" ]; then
  say="$STOP$Pollen$STOP$PollenArt$STOP"
  fi
  

 say_curl=$(echo $say | sed -e 's/ /\+/g' | sed -e 's/ä/\%C3\%A4/g'| sed -e 's/ö/\%C3\%B6/g'| sed -e 's/ü/\%C3\%BC/g'| sed -e 's/ß/s/g' )

 
  
  #echo $say
  #echo "GefTemp
  #echo $GefTemp
  #echo ""
  #echo $say_curl
 
  
  #echo "mary already running"
  curl --request GET "http://localhost:59125/process?INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&INPUT_TEXT=$say_curl&OUTPUT_TEXT=&AUDIO_OUT=WAVE_FILE&LOCALE=de&VOICE=dfki-pavoque-neutral-hsmm&AUDIO=WAVE_FILE" > weather_"$dayvar"_$artvar.wav
 
 
 done # wetter art (long usw)
 
 done # wetter tage!
   
  # Ende Timer
   rm ~/.linjark/.weather_update
 
  
fi # timer
  
 fi # weather script
 ##### Ende
###################
  
  
  
  
  
  
  
  
  
  
  
done # monster while