Install
========

Installationshinweise für die verschiedenen Programme. Alles (außer Simon) wird nach $HOME/.linjark installiert.

Installation von linjark
------------------------

1. Downloade das install.sh skript und mache es ausführbar:
```
wget https://raw.githubusercontent.com/ManuGithubSteam/LinJarK/master/install.sh

chmod +x install.sh
```
2. Starte das script mit dem "i" parameter um die installation zu starten
```
./install.sh i
```

WICHTIG: Der Pfad "/home/$USER/.linjark/bin" wird zur $PATH variable hinzugefügt. Es sollte sichergestellt sein,das die .bashrc aufegrufen wird, und Simon über die neue Path variable bescheid weiß, sonst funktioniert Simon nicht richtig.
Je nach Desktopumgebung ist es nicht sicher ob der Pfad exportiert wird (KDE wird unterstützt, ggf ist ein re-login nötig.)

Du kannst den Pfad auch in deine /etc/environment eintragen. Leis dazu die dokumenation deiner distribution.

Installation des Sprachpaketes für MarryTTS
-------------------------------------------

Um die Sprachausgabe von MarryTTS nutzen zu können, muss man ein Sprachpaket installieren.

Wähle im Komponenten-Installer (sollte jetzt schon geöffnet sein) folgendes:

1. Language: DE

2. Lang Packs:

 - dfki-pavogue-neutral-hsmm
 
3. Klicke auf "Install selected"

4. Akzeptiere die Lizenz

5. Warte bis der Download des Paketes abgeschloßen ist und schliese dann den Komponenten-Installer

6. Fahre mit der linjark installation fort (in der Konsole -> geschlecht wählen)

Installation von Simon
----------------------

Benutze das Repository deiner distribution um Simon (0.4.1) zu Installieren. Es ist ein KDE programm und hat KDE Abhängigkeiten und auch noch welche um das Sprachmodel an zu passen (sphinxtrain, sphinxbase etc)

Vergewissere dich, das dein Mikrofon unter Linux erkannt wird (zb in Audacity) und das Simon korrekt eingerichtet ist und das Mikorphon kalibriert und erkannt wird.

Siehe auch: 

https://userbase.kde.org/Simon
https://userbase.kde.org/Simon/Handbook

Man sollte unbedingt mal ins Handbuch schauen, um Simon richtig zu konfigurieren. Wenn Simon nicht korrekt arbeitet, können die linjark Skripte auch nicht richtig funktionieren.

Wenn du Simon von dem Quellen kompilierst, vergewissere dich das +nls, +sphinx einkompiliert sind.

Installation des Sprachenmodells
---------------------------------

Klicke auf "Configure Accoustic Model" -> "Open Model" -> Import

Nun gehe in das Verzeichniss /home/$USER/.linjark/ hier sollte sich eine .sbm Datei befinden. Importiere diese Datei.

Wähle die box: "Adapt base model....." an um das Standartmodel deiner Sprache mit training an zu passen.

INFO: Das Model zu trainieren und die verbesserte version "ausrechnen"  zu lassen, kann sehr viele Stunden in Anspruch nehmen. Das hängt von CPU und RAM ab.

TIPP: Simon startet nach __jedem__ abgeschloßenen Training die berechung den neuen Modells. Deshalb ist es eine gute Idee unter "Datei" "Verbindung mit Server" den Haken zu entfernen. 

Dadurch wird das Modell nicht immer neu berechnet. 
Wenn man dann mit dem trainieren fertig ist, kann man den hacken wieder rein machen. Dann wird das Modell mit deinem Sprachmuster gebaut.

Installation von Modulen
------------------------

Gehe auf Github in den "modules" Order und lade dir die Module in dein Homeverzeichniss herunter.

https://github.com/ManuGithubSteam/LinJarK

Entpacke das tar.gz (ohne! Autodetct Unterordner), die scripte werde automatisch an die richtigen Stellen entpackt.

Öffne Simon und klicke auf "Manage Scenarios" -> "Open" -> "Import from file" dann wähst du die .scenario Datei aus, die sich in dein HOME entpackt hat.

Achte drauf, ob auch eine README entpackt wurde. LESEN!


Enjoy :-)