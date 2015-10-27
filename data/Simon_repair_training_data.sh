#!/bin/bash

#Fixing wrong encoding (US ASCII) while saving the stuff

killall simon
killall simond

kdialog --caption "Bitte warten" --title "Wichtig" --msgbox "Repariere Trainingsdaten..."

cd ~/.kde4/share/apps/simon/model/training.data

#convmv --notest -r -f UTF-8 -t ISO-8859-1 .

find . -type f -print0 | perl -n0e '$new = $_; if($new =~ s/[^[:ascii:]]/#/g) { print("Renaming $_ to $new\n"); rename($_, $new); print("Renaming $_ to $new\n"); rename($_, $new);}'

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

cd ..

cp prompts prompts_back

cat prompts | sed -e 's/[^A-Za-z0-9._-]/!/g' | sed 's/!!ffne/öffne/g'| sed 's/_!ffne/_öffne/g' | sed 's/!!FFNE/ÖFFNE/g'| sed 's/!FFNE/ÖFFNE/g' |  sed 's/!!default!!/\ "default"\ /g' | sed 's/schlie!!en/schließen/g' | sed 's/einf!!gen/einfügen/g'|sed 's/Einf!!gen/Einfügen/g' | sed 's/EINF!GEN/EINFÜGEN/g' | sed 's/EINF!!GEN/EINFÜGEN/g'| sed 's/l!!schen/löschen/g'|sed 's/L!!SCHEN/LÖSCHEN/g'| sed 's/L!SCHEN/LÖSCHEN/g' | sed 's/N!!chste/Nächste/g'| sed 's/N!CHSTE/NÄCHSTE/g' | sed 's/gr!!!!er/größer/g' | sed 's/GR!SSER/GRÖSSER/g' | sed 's/l!!uft/läuft/g' | sed 's/L!UFT/LÄUFT/g' | sed 's/_f!!r_/_für_/g' | sed 's/ZUF!LLIG/ZUFÄLLIG/g'| sed 's/ZUF!!LLIG/ZUFÄLLIG/g'| sed 's/SCHLIE!!EN/SCHLIEßEN/g'|sed 's/F!R/FÜR/g' | sed 's/_!!bermorgen/_übermorgen/g' | sed 's/!BERMORGEN/ÜBERMORGEN/g' | sed 's/zuf!!llig/zufällig/g' | sed 's/ZUF!LLIG/ZUÄLLIG/g' | sed 's/n!!chste/nächste/g' | sed 's/R!!ckg!!ngig/Rückgängig/g' | sed 's/R!CKG!NGIG/RÜCKGÄNGIG/g' | sed 's/Zur!!ck/Zurück/g' | sed 's/ZUR!CK/ZURÜCK/g' | sed 's/f!!nf/fünf/g' | sed 's/F!NF/FÜNF/g'|sed 's/ZW!!LF/ZWÖLF/g'|sed 's/F!!NF/FÜNF/g'|sed 's/F!!R/FÜR/g' |sed 's/GR!!ER/GRÖSSER/g'| sed 's/Zw!!lf/Zwölf/g' |sed 's/ARBEITSFL!!CHE/ARBEITSFLÄCHE/g'|sed 's/N!CHSTE/NÄCHSTE/g'|sed 's/N!!CHSTE/NÄCHSTE/g'|sed 's/L!UFT/LÄUFT/g'|sed 's/R!!CKG!!NGIG/RÜCKGÄNGIG/g'|sed 's/L!!UFT/LÄUFT/g'| sed 's/ZW!LF/ZWÖLF/g' | sed 's/F!!nf/Fünf/g' |sed 's/WINDVERH!!LTNISSE/WINDVERHÄLTNISSE/g'|sed 's/_ ber/_über/g'| sed 's/_f!r_/_für_/g'|sed 's/Empf!!nger/Empfänger/g' | sed 's/EMPF!NGER/EMPFÄNGER/g' | sed 's/Ausw!!hlen/Auswählen/g' | sed 's/AUSW!HLEN/AUSWÄHLEN/g' | sed 's/!!bersetzung/Übersetzung/g' | sed 's/Windverh!ltnisse/Windverhältnisse/g'| sed 's/!!BERSETZUNG!/ÜBERSETZUNG!/g'|sed 's/!BERSETZUNG!/ÜBERSETZUNG!/g' | sed 's/!!bersetze/übersetze/g' | sed 's/!BERSETZE/ÜBERSETZE/g' | sed 's/Franz!!sisch/Französisch/g' | sed 's/FRANZ!SISCH/FRANZÖSISCH/g' |sed 's/FRANZ!!SISCH/FRANZÖSISCH/g'| sed 's/Windverh!!ltnisse/Windverhältnisse/g' | sed 's/WINDVERH!LTNISSE/WINDVERHÄLTNISSE/g' | sed 's/Windst!!rke/Windstärke/g' | sed 's/WINDST!RKE/WINDSTÄRKE/g' | sed 's/WINDST!!RKE/WINDSTÄRKE/g'| sed 's/Abk!!rzung/Abkürzung/g' | sed 's/ABK!RZUNG/ABKÜRZUNG/g'|sed 's/ABK!!RZUNG/ABKÜRZUNG/g' | sed 's/Arbeitsfl!!che/Arbeitsfläche/g' | sed 's/ARBEITSFL!CHE/ARBEITSFLÄCHE/g' > b

cat b | sed 's/!/\ /g' >t

rm prompts
#rm b

mv t prompts

kdialog --caption "Bitte warten" --title "Wichtig" --msgbox "Fertig! Bitte Simon neustarten um das Sprachmodel neu zu berechnen."

