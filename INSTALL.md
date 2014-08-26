Install
========

To get speech recognition you need basicly four things:

- A Language model that supports your said words
- Simon, the speech recognition programm
- MarryTTS the spreech systesizer to answer you
- A Scenario for Simon, so some action can be done

This document will guide you through the install process. Everything (apart from Simon) is installed in .linjark in your HOME.

First we will download the linjark script, that in turn will download and install MarryTTS and some other things.
Be aware that you still need to install Simon from your distribution repository.

Installation of linjark
------------------------

__Depencies:__

Linkajrk depends on the following to function properly. Please install the necessay packages.

 wmctrl, xdotool, html-xml-utils, kdialog, sox, xclip

```
wmctrl xdotool html-xml-utils kdialog sox xclip
```

1. Download the Install.sh script and make it executeable:
```
wget https://raw.githubusercontent.com/ManuGithubSteam/LinJarK/master/install.sh

chmod +x install.sh
```
2. Start the script with "i" parameter to start Install
```
./install.sh i
```

IMPORTANT: Be aware that "/home/$USER/.linjark/bin" gets added to your $PATH var. Be sure that your .bashrc is called or .bash_profile gets executed on login, otherwiese Simon will not function properly!
You can also add the Path to your /etc/environment. Check your distribution dokumentation for that!

You can start Simon this way in a terminal:

PATH=\$PATH:/home/$USER/.linjark/bin simon

NOTE: If you are not happy with the predefined words who are used to adress you (Sir or Miss) just edit .linjark/gender file and write in it waht you want eg. Lord

Installation of Simon
----------------------

Use the repository of your distribution to install Simon (min version: 0.4.1). It is a KDE/QT programm and has KDE/QT depencies among others used for speech model generation (sphinxtrain, sphinxbase etc). 

For __Gentoo__ this would be:

USE Flags: kdepim, libsamplerate, nls, opencv, sphinx
```
emerge simon pocketsphinx sphinx3 SphinxTrain
```

For __Debain/Ubuntu based__ distros:

```
apt-get install simon sphinx3 sphinxtrain
```

For __Opensuse__ :

Add the repository: "OpenSUSE Build Service: KDE:Extras" (in Community Repositorys)

```
zypper in simon
```

Also install SphinxTrain from software.opensuse.org:

http://software.opensuse.org/package/sphinxtrain?search_term=sphinxtrain

Also make sure that your microphone is properly configured and seen/heard by simon and alsa etc. You can test this for example with Audacity :-D

See: 

https://userbase.kde.org/Simon
https://userbase.kde.org/Simon/Handbook
https://forum.kde.org/viewforum.php?f=216

In general it is a very good idea to read the handbook! Simon must work correctly for the speech recognition. 

If you compile it from source, make sure that +nls, +sphinx are compiled in!

Installation of the language model in Simon
---------------------------------------------

Navigate in Simon to "Configure Accoustic Model" -> "Open Model" -> "Import"

Now navigate to you HOME there sould be an .sbm file. Import it.

Tick the box: "Adapt base model using training samples"

NOTE: Be aware that training and computing the model can take many hours (5-12 hours and more!!!) dependent on CPU and RAM.

TIP: As Simon want to compile a new model every time you finished __one__ training session it is a good idea to remove the tick in "File" "Connect to server". Then the model will not be compiled. 

When you are finished training the sentences of your scenarios (recognition rate should be above 30)
Tick the box again and the model will compile with your speech patterns.


Installation of Modules
------------------------

Go into the modules folder on Github and download the module you want.

https://github.com/ManuGithubSteam/LinJarK

Then extract it in your Home folder. The scripts will be automatically installed into the right folder.
```
tar xvf MODULE.tar.gz
```
Open up Simon and click on "Manage Scenarios" -> "Open" -> "Import from file" then import the .scenario file from your HOME folder.

Check if there is a READEME file in your HOME folder and read it :-)

Use
----

It is most likely that you need to train Simon to your voice, otherwise it will not recognise your speech. To do that, use the provided training sentences in the modules.

A good recognition rate is about 30-50 but more is even better (100-120). This depends also on the spoken word, shorter words are harder to train.



Enjoy :-)