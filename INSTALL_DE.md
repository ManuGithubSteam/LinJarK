Installationshinweise
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

__Abhänigkeiten/Vorraussetzungen:__

Linkajrk benötigt die folgenden Programme um richtig zu funktioieren:

 wmctrl, xdotool, html-xml-utils, kdialog, sox, xclip

```
wmctrl xdotool html-xml-utils kdialog sox xclip
```
 
 
__Installation von linjark__

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
Je nach Desktopumgebung ist es nicht sicher ob der Pfad exportiert wird.

Simon am besten in einem Terminal starten:

PATH=\$PATH:/home/$USER/.linjark/bin simon

Du kannst den Pfad auch in deine /etc/environment eintragen. Ließ dazu die Dokumentation deiner Distribution.

BEACHTE: Falls du nicht glücklich damit sein solltest, wie du angesprochen wirst (Sir, Miss) kannst du das einfach in der Datei /home/$USER/.linjark/gender ändern. zB in Großherzog :-D


Installation von Simon
----------------------

Benutze das Repository deiner Distribution um Simon (0.4.1) zu Installieren. Es ist ein KDE Programm und hat KDE Abhängigkeiten und auch noch welche um das Sprachmodel an zu passen (sphinxtrain, sphinxbase etc)

Für __Gentoo__:

Es müssen die richtigen USE Flags gesetz werden (kdepim, libsamplerate, nls, opencv, sphinx)

```
emerge simon SphinxTrain pocketsphinx sphinx3
```

Für __Debain basierende (testing)/K/ubuntu__ distros:

```
sudo apt-get install simon sphinx3 sphinxtrain
```

Für __Opensuse__ :

Es muss das Repository: "OpenSUSE Build Service: KDE:Extras" (in Community Repositorys) aktiviert sein!

```
zypper in simon
```
Außerdem muss noch SphinxTrain von software.opensuse.org installiert werden:

http://software.opensuse.org/package/sphinxtrain?search_term=sphinxtrain

Vergewissere dich, das dein Mikrofon unter Linux erkannt wird (zb in Audacity) und das Simon korrekt eingerichtet ist und das Mikrophon kalibriert und erkannt wird. Auch die Soundausgabe muss in Simon richtig konfiguriert werden!

Siehe auch: 

https://userbase.kde.org/Simon
https://userbase.kde.org/Simon/Handbook
https://forum.kde.org/viewforum.php?f=216

Man sollte unbedingt mal ins Handbuch schauen, um Simon richtig zu konfigurieren. Wenn Simon nicht korrekt arbeitet, können die linjark Skripte auch nicht richtig funktionieren.

Wenn du Simon von dem Quellen kompilierst, vergewissere dich das +nls, +sphinx einkompiliert sind.

Installation des Sprachenmodells in Simon
---------------------------------

Klicke auf "Akustikmodel einrichten" -> "Modell öffnen" -> "Importieren"

Nun gehe in dein Homeverzeichnis hier sollte sich eine .sbm Datei befinden. Importiere diese Datei.

Wähle die Box: "Adaptiere Basismodell mit Trainingsaufnahmen" an um das Standartmodel deiner Sprache mit Training anzupassen.

INFO: Das Model zu trainieren und die verbesserte Version berechnen zu lassen, kann sehr viele Stunden (5-12 Stunden und mehr!!!) in Anspruch nehmen. Das hängt von CPU und RAM ab.

TIPP: Simon startet nach __jedem__ abgeschlossenen Training die Berechnung des neuen Modells. Deshalb ist es eine gute Idee unter "Datei" "Verbindung mit Server" den Haken zu entfernen wenn man mehrmals Traingsaufnahmen einsprechen will. 

Dadurch wird das Modell nicht immer neu berechnet. 
Wenn man dann mit dem trainieren fertig ist, kann man den hacken wieder rein machen. Dann wird das Modell mit deinem Sprachmuster gebaut.

Installation von Modulen
------------------------

Gehe auf Github in den "modules" Order und lade dir die Module in dein Homeverzeichnis herunter.

https://github.com/ManuGithubSteam/LinJarK

Entpacke das tar.gz (ohne! autodetect Unterordner), die Scripte werde automatisch an die richtigen Stellen entpackt.

tar xf MODULE.tar.gz

Öffne Simon und klicke auf "Szenarien verwalten" -> "Öffnen" -> "Aus Datei importieren" dann wählst du die .scenario Datei aus, die sich in dein HOME entpackt hat.

Achte drauf, ob auch eine README entpackt wurde. LESEN!

Nutzung
--------

Wahrscheinlich muss Simon trainiert werden, bevor er deine Aussprache versteht. Dies kannst du mit den mitgelieferten Trainingstexten in den Modulen tun.

Eine Erkennungsrate von 100-120 ist empfehlenswert, mehr ist jedoch immer besser. Es hängt auch von den einzelnen Wörtern ab, wie viel training benötigt wird.


Enjoy :-)