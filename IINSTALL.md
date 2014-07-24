Install
========

This document will guide you through the install process. Everything is installed in .linjark in your HOME.

Installation of linjark
------------------------

1. Download the Install.sh script and make it executeable:

wget https://github.com/ManuGithubSteam/LinJarK/blob/master/install.sh
chmod + install.sh

2. Start the script with "i" parameter to start Install

./install.sh i

Installation of the Marry TTS Lang Packs
----------------------------------------

To use MarryTTS you need to install 3 lang packs.

In the component installer, select:

1. Language: DE

2. Lang Packs:

 - dfki-pavogue-neutral
 - dfki-pavogue-neutral-hsmm
 - bits3-hsmm
 
 
3. Click on "Install selected"

Installation of Simon
----------------------

Use the repository of your distribution to install Simon. It is a KDE/QT programm and has KDE/QT depencies among others used for speech model generation. 

Also make sure that your mic is properly configured and seen/heard by simon and alsa etc.

See: 

https://userbase.kde.org/Simon
https://userbase.kde.org/Simon/Handbook


Installation of the language model
-----------------------------------

Navigate in Simon to "Configure Accoustic Model" -> "Open Model" -> Import

Now navigate to /home/USER/.linjark/ there sould be an .sbm file. Import it.

Tick the box: "Adapt base model....."

NOTE: Be aware that training and computing the model can take many hours dependent on CPU and RAM.

TIPP: As Simon want to compile a new model every time you finished one Training session it is a good idea to remove the tick in "File" "Connect to server". Then the model will not be compiled. 

When you are finished training the sentences of your Scenarios (Recognition Rate should be above 30)
Tick the box again and the model will compile with your speech patterns.



