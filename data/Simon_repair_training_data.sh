#!/bin/bash

#Fixing wrong encoding (US ASCII) while saving the stuff

killall simon
killall simond

kdialog --caption "Bitte warten" --title "Wichtig" --msgbox "Repariere Trainingsdaten..."

cd ~/.kde4/share/apps/simon/model/training.data

#convmv --notest -r -f UTF-8 -t ISO-8859-1 .

find . -type f -print0 | perl -n0e '$new = $_; if($new =~ s/[^[:ascii:]]/#/g) { print("Renaming $_ to $new\n"); rename($_, $new); print("Renaming $_ to $new\n"); rename($_, $new);}'

samples=$(ls -1 | wc -l)

sleep 1
# very very very slow when we got many files!

cd ~/.kde4/share/apps/simon/model

python fix_names.py

sleep 1
cd ~/.kde4/share/apps/simon/model/training.data
###
ls -1 | sed 's/.wav//g' | sed 's/$/ "default" /' > ../1.txt

ls -1 | sed 's/.wav//g' | awk -F '_S[0-9]+_.*$' '{print $1}' | sed 's/_/ /g' | awk '{print toupper($0)}' > ../2.txt


cd ..

cp prompts prompts_back

paste 1.txt 2.txt > 3.txt

cat 3.txt | sed 's/\t//g' > prompts

rm 1.txt
rm 2.txt
rm 3.txt

# remove old models

cd /tmp
cd /tmp/kde-$USER/simond/default/compile/sphinx/

rm -fr default\{*

space=$(df -Ph . | tail -1 | awk '{print $4}')

cd 

kdialog --caption "Fertig" --title "Wichtig" --msgbox "Trainingsdaten repariert.\n $space an Speicherplatz verfügbar. \n Es sollte mindestens 1 GB verfügbar sein. \n $samples samples.\n Bitte Simon neu starten um Model neu zu berechnen."

kdialog --caption "Fertig" --title "Wichtig" --msgbox "Es wird empfohlen, von den Trainingsdaten regelmäsig eine Sicherung an zu legen."



