Install
========

Um Spracherkennung unter Linux einzurichten, benötigt man vier Dinge:

- Ein Sprachmodel, dass die gesagten Wörter enthällt
- Simon das Spracherkennungsprogramm (gleicht das Gesagte mit dem Model ab)
- MarryTTS, der Sprachsynthesizer um Antworten zu bekommen
- Ein Scenario für Simon, um Befehle oder ähnliches auszuführen, wenn ein Satz erkannt wurde

Installationshinweise für die verschiedenen Programme. Alles (außer Simon) wird nach $HOME/.linjark installiert.

Zuerst downloaden wir das LinJarK Script, dieses wird einiges schon einrichten und installieren, so dass weniger Handarbeit erforderlich ist.

Installation von linjark
------------------------

1. Downloade das install.sh Skript und mache es ausführbar:
```
wget https://raw.githubusercontent.com/ManuGithubSteam/LinJarK/master/install.sh

chmod +x install.sh
```
2. Starte das Script mit dem "i" Parameter um die Installation zu starten
```
./install.sh i
```

WICHTIG: Der Pfad "/home/$USER/.linjark/bin" wird zur $PATH variable hinzugefügt. Es sollte sichergestellt sein,das die .bashrc aufegrufen wird, und Simon über die neue Path variable Bescheid weiß, sonst funktioniert Simon nicht richtig.
Je nach Desktopumgebung ist es nicht sicher ob der Pfad exportiert wird (KDE wird unterstützt, ggf ist ein re-login nötig.)

Du kannst den Pfad auch in deine /etc/environment eintragen. Ließ dazu die Dokumentation deiner Distribution.

BEACHTE: Falls du nicht glücklich damit sein solltest, wie du angesprochen wirst (Sir, Miss) kannst du das einfach in der Datei /home/$USER/.linjark/gender ändern. zB in Großherzog :-D

Installation des Sprachpaketes für MarryTTS
-------------------------------------------

Um die Sprachausgabe von MarryTTS nutzen zu können, muss man ein Sprachpaket installieren.

Wähle im Komponenten-Installer (sollte jetzt schon geöffnet sein) folgendes:

1. Language: DE

2. Lang Packs:

 - dfki-pavogue-neutral-hsmm
 
3. Klicke auf "Install selected"

4. Akzeptiere die Lizenz

5. Warte bis der Download des Paketes abgeschlossen ist und schließe dann den Komponenten-Installer

6. Fahre mit der linjark Installation fort (in der Konsole -> Geschlecht wählen)

Installation von Simon
----------------------

Benutze das Repository deiner Distribution um Simon (0.4.1) zu Installieren. Es ist ein KDE Programm und hat KDE Abhängigkeiten und auch noch welche um das Sprachmodel an zu passen (sphinxtrain, sphinxbase etc)

Für __Gentoo__:
```
emerge simon
```

Für __Debain basierende__ distros:

```
apt-get install simon
```

Vergewissere dich, das dein Mikrofon unter Linux erkannt wird (zb in Audacity) und das Simon korrekt eingerichtet ist und das Mikrophon kalibriert und erkannt wird.

Siehe auch: 

https://userbase.kde.org/Simon
https://userbase.kde.org/Simon/Handbook

Man sollte unbedingt mal ins Handbuch schauen, um Simon richtig zu konfigurieren. Wenn Simon nicht korrekt arbeitet, können die linjark Skripte auch nicht richtig funktionieren.

Wenn du Simon von dem Quellen kompilierst, vergewissere dich das +nls, +sphinx einkompiliert sind.

Installation des Sprachenmodells in Simon
---------------------------------

Klicke auf "Configure Accoustic Model" -> "Open Model" -> Import

Nun gehe in das Verzeichniss /home/$USER/.linjark/ hier sollte sich eine .sbm Datei befinden. Importiere diese Datei.

Wähle die box: "Adapt base model....." an um das Standartmodel deiner Sprache mit Training an zu passen.

INFO: Das Model zu trainieren und die verbesserte Version "ausrechnen"  zu lassen, kann sehr viele Stunden in Anspruch nehmen. Das hängt von CPU und RAM ab.

TIPP: Simon startet nach __jedem__ abgeschlossenen Training die Berechnung den neuen Modells. Deshalb ist es eine gute Idee unter "Datei" "Verbindung mit Server" den Haken zu entfernen. 

Dadurch wird das Modell nicht immer neu berechnet. 
Wenn man dann mit dem trainieren fertig ist, kann man den hacken wieder rein machen. Dann wird das Modell mit deinem Sprachmuster gebaut.

Installation von Modulen
------------------------

Gehe auf Github in den "modules" Order und lade dir die Module in dein Homeverzeichnis herunter.

https://github.com/ManuGithubSteam/LinJarK

Entpacke das tar.gz (ohne! autodetect Unterordner), die Scripte werde automatisch an die richtigen Stellen entpackt.

Öffne Simon und klicke auf "Manage Scenarios" -> "Open" -> "Import from file" dann wählst du die .scenario Datei aus, die sich in dein HOME entpackt hat.

Achte drauf, ob auch eine README entpackt wurde. LESEN!


Enjoy :-)