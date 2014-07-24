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
   wget https://raw.githubusercontent.com/ManuGithubSteam/LinJarK/master/INSTALL.md
   sleep 4 
   kate INSTALL.md &
   wget https://github.com/ManuGithubSteam/LinJarK/raw/master/voxforge-de-r20140719.sbm
   
   cd marytts-5.1/bin
   chmod +x marytts-server.sh
   chmod +x marytts-component-installer.sh
   ./marytts-component-installer.sh
   
   cd ~
      
   echo "PATH=\$PATH:/home/$USER/.linjark/bin" >> .bashrc
   echo "export PATH" >> .bashrc

   PATH=$PATH:/home/$USER/.linjark/bin   
   export PATH
   
   
    echo ""
   echo ""
    echo "#########"
    echo "# ATTENTION!!! PATH variable is modified to be able to launch scripts in .linjark/bin"
     echo "# .bashrc was altered!"
     echo "#"
     echo "#  PATH=$PATH:/home/$USER/.linjark/bin  "
     echo "#   make sure it gets EXPORTED everytime before you start simon!"
     echo "#########"
     echo ""
    
fi