#!/bin/bash

if [ -z "$1" ]
  then
    echo ""
    echo "This script will install some basic files and the MarryTTS Server on your PC"
    echo "It will be installed in /home/USER/.linjark"
    echo ""
    echo "It will also guide you through the installation of the lang-packs for MarryTTS"
    echo "and provide basic guidiance to install Simon and the speech model"
    echo ""
    echo "To start the install restart the script with ./install i"
    exit
fi

if [ "$1" == 'i' ]
  then
    cd ~
    mkdir .linjark
    mkdir .linjark/scripts
    mkdir .linjark/conky
    cd .linjark/
    
   wget https://bitbucket.org/marytts/marytts/downloads/marytts-5.1.zip
   unzip marytts-5.1.zip
   wget wget https://github.com/ManuGithubSteam/LinJarK/blob/master/INSTALL.md
   kate INSTALL.md &
   
   cd marytts-5.1/bin
   chmod +x marytts-server.sh
   chmod +x marytts-component-installer.sh
   ./marytts-component-installer.sh
   
   
   
fi