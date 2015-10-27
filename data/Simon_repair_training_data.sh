#!/bin/bash

#Fixing wrong encoding (US ASCII) while saving the stuff

killall simon
killall simond

kdialog --caption "Bitte warten" --title "Wichtig" --msgbox "Repariere Trainingsdaten..."

cd ~/.kde4/share/apps/simon/model/training.data

#convmv --notest -r -f UTF-8 -t ISO-8859-1 .

find . -type f -print0 | perl -n0e '$new = $_; if($new =~ s/[^[:ascii:]]/#/g) { print("Renaming $_ to $new\n"); rename($_, $new); print("Renaming $_ to $new\n"); rename($_, $new);}'


# very very very slow when we got many files!


for f in *; do
mv $f $(echo $f | sed -e 's/_####ffne/_öffne/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_##ffne/_öffne/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/schlie####en/schließen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/schlie##en/schließen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/einf####gen/einfügen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/einf##gen/einfügen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_l####schen_/_löschen_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_l##schen_/_löschen_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Empf####nger/Empfänger/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Ausw####hlen/Auswählen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Empf##nger/Empfänger/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Ausw##hlen/Auswählen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/N####chste/Nächste/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/N##chste/Nächste/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/n####chstes/nächstes/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/n##chstes/nächstes/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/R####ckg####ngig/Rückgängig/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/R##ckg##ngig/Rückgängig/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/gr########er/größer/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/gr####er/größer/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_####bersetze_/_übersetze_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_##bersetze_/_übersetze_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/####bersetzung/Übersetzung/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/##bersetzung/Übersetzung/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Arbeitsfl####che/Arbeitsfläche/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Arbeitsfl##che/Arbeitsfläche/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/zuf####llig/zufällig/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/zuf##llig/zufällig/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/F####nf/Fünf/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/F##nf/Fünf/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Zw####lf/Zwölf/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Zw##lf/Zwölf/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/####bermorgen/übermorgen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/##bermorgen/übermorgen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_f####r_/_für_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/_f##r_/_für_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/f####nf/fünf/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/f##nf/fünf/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/st####rke/stärke/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/st##rke/stärke/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Windverh####ltnisse/Windverhältnisse/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Windverh##ltnisse/Windverhältnisse/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/n####chste/nächste/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Abk####rzung/Abkürzung/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Abk##rzung/Abkürzung/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/l####uft_/läuft_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/l##uft_/läuft_/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Einf####gen/Einfügen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Einf##gen/Einfügen/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Zur####ck/Zurück/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Zur##ck/Zurück/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Franz####sisch/Französisch/g');done

for f in *; do
mv $f $(echo $f | sed -e 's/Franz##sisch/Französisch/g');done


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
