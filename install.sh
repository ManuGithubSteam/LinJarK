#!/bin/bash

if [ -z "$1" ]
  then
  echo ""
  echo "# Copyright 2015 Manuel Soukup"
  echo "# License: GPL"
  echo ""
    echo ""
    echo "This script will install some basic files and the MarryTTS Server on your PC"
    echo "It will be installed in /home/USER/.linjark"
    echo ""
    echo "It will also guide and provide basic guidiance to install Simon and the speech model"
    echo ""
    echo "To start the install restart the script with ./install.sh i"
    exit
fi

if [ "$1" == 'i' ]
  then
  
  echo ""
  echo "Creating folders"
  echo ""
  
    cd ~
    mkdir .linjark
    mkdir .linjark/scripts
    mkdir .linjark/conky
    mkdir .linjark/bin
    cd .linjark/
      
  echo ""
  echo "Downloading/Install MarryTTS...."
  echo ""
   wget https://github.com/marytts/marytts/releases/download/v5.1.2/marytts-5.1.2.zip
   unzip marytts-5.1.2.zip &2> /dev/null
   
   cd marytts-5.1.2/
   
   wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/marry_5.1_voice.tar.gz
   tar xf marry_5.1_voice.tar.gz
   
   cd bin
   chmod +x marytts-server.sh
   chmod +x marytts-component-installer.sh
   cd ..
   cd ..
 
 cd ~
 cd .linjark
 
  wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/start_marry.sh
  chmod +x start_marry.sh
  
  wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/start_daemon.sh
  chmod +x start_daemon.sh
  
  wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/linjark_daemon.sh
  chmod +x linjark_daemon.sh
  
  cd ~
  echo ""
  echo "Open INSTALL manual"
  echo ""
  
  firefox https://manugithubsteam.github.io/LinJarK/install.html
   
#         echo ""
#   echo "Install Marry language pack, see readme for the right one :-)"
#   echo ""
#   ./marytts-component-installer.sh
#    
  cd ~
   
  echo ""
  echo "Downloading Simon repair training data script"
  echo ""
   
  wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/Simon_repair_training_data.sh
  chmod +x Simon_repair_training_data.sh
  
  
  echo ""
  echo "Downloading LM for Simon"
  echo ""
   wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/voxforge-de-r20141117.sbm
   
   cd .linjark/
   wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/voxforge-de-r20141117_dict.dic
   cd ~
           echo ""
  echo "Edit PATH variable to be able to launch scripts"
  echo ""
   
  echo "PATH=\$PATH:/home/$USER/.linjark/bin" >> .bashrc
   echo "export PATH" >> .bashrc

   
   mkdir bin
   awk_path="/home/$USER/bin/simon"
cat > "${awk_path}" <<EOT
#!/bin/bash

ON_PI="no"

simond &
PATH=$PATH:/home/$USER/.linjark/bin simon &

if [ "\$ON_PI" == "yes" ]
  then

sleep 4
  
  wmctrl -a Simon
  sleep 1 && xdotool key Control+t
 
 fi

EOT
chmod u+x "${awk_path}"
   cd ~/bin
   chmod +x simon
   cd ~
      
    echo ""
   echo ""
    echo "#########"
    echo "# ATTENTION!!! PATH variable is modified to be able to launch scripts in .linjark/bin"
     echo "# .bashrc was altered!"
     echo "#"
     echo "#  PATH=$PATH:/home/$USER/.linjark/bin  "
     echo "#   make sure it gets exported everytime before you start Simon!"
     echo "#"
     echo "#  You can start simon in a bash normaly, as the Path is in your .bashrc"
     echo "#"
     echo "#  You can start simon like this from a non bash terminal:   "
     echo "#"
     echo "#  PATH=$PATH:/home/$USER/.linjark/bin simon"
     echo "#"
     echo "#  Or you use the 'linjark' start script in $HOME/bin" 
     echo "#"
     echo "#  To get rid of the 'bin' in you home, you can copy the linjark script to /usr/local/bin"
     echo "#"
     echo "#"
     
     
     echo "#########"
     echo ""
   
   
   PATH=$PATH:/home/$USER/.linjark/bin   
   export PATH

  echo ""
  echo "Making MarryTTS Autostart on KDE Login"
  echo ""
   cd .kde4
   mkdir Autostart
   cd Autostart
   ln -s ../../.linjark/start_marry.sh
   
   echo ""
  echo "Making  Linjark daemon Autostart on KDE Login"
  echo ""
   cd .kde4
   mkdir Autostart
   cd Autostart
   ln -s ../../.linjark/start_daemon.sh
   
  echo ""
  echo "Downloading sample_fix script"
  echo ""
   cd ~
   cd .kde4/share/apps
   mkdir simon
   cd simon
   mkdir model
   cd model
   wget https://raw.githubusercontent.com/ManuGithubSteam/LinJarK/master/data/fix_names.py
   cd ~
   echo ""
   echo " Please specify your gender/sex:"
   echo ""
    echo "This will allow MarryTTS to resond to you in the right words :-D"  
   echo ""
   echo "Press [m] for male, [f] for female"
   echo ""
   read SEX

   if [ "$SEX" == 'm' ]
  then
  
  echo " Sir " > /home/$USER/.linjark/gender
  
  fi
   
      if [ "$SEX" == 'f' ]
  then
  
  echo " Miss " > /home/$USER/.linjark/gender
  
  fi
   
   if [ ! -f /home/$USER/.linjark/gender ]
   then
   echo " Sir " > /home/$USER/.linjark/gender
   fi
    echo ""
   echo ""
    echo " Intallation finished"
   echo ""
    
   echo ""
    echo " Now install Simon and download an install some modules :-D"
   echo ""
      echo ""
    echo " After the installation of Simon, you can start Simon with $USER/bin/simon"
   echo ""
   
   
    echo ""
    echo " Get your guns and have fun with your own electronic butler....."
   echo ""
    
   cd ~
   rm install.sh
  
fi