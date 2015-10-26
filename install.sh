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
    echo "To start the install restart the script with ./install i"
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
   wget https://bitbucket.org/marytts/marytts/downloads/marytts-5.1.zip
   unzip marytts-5.1.zip &2> /dev/null
   
   cd marytts-5.1
   
   wget https://github.com/ManuGithubSteam/LinJarK/raw/master/data/marry_5.1_voice.tar.gz
   tar xf marry_5.1_voice.tar.gz
   
   cd bin
   chmod +x marytts-server.sh
   chmod +x marytts-component-installer.sh
   cd ..
   cd ..
   
   wget 
   chmod +x start_marry.sh
   
  echo ""
  echo "Downloading INSTALL.md"
  echo ""
   
   wget https://raw.githubusercontent.com/ManuGithubSteam/LinJarK/master/INSTALL_DE.md
   sleep 4 
   kate INSTALL_DE.md &2> /dev/null


   
#         echo ""
#   echo "Install Marry language pack, see readme for the right one :-)"
#   echo ""
#   ./marytts-component-installer.sh
#    
   cd ~
   
  echo ""
  echo "Downloading Simon repair training data script"
  echo ""
   
  wget https://github.com/ManuGithubSteam/LinJarK/raw/master/Simon_repair_training_data.sh
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
   awk_path="/home/$USER/bin/linjark"
cat > "${awk_path}" <<EOT
#!/bin/bash

PATH=$PATH:/home/$USER/.linjark/bin simon
EOT
chmod u+x "${awk_path}"
   
      
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
   echo " Please specify your gender/sex:"
   echo ""
    echo "This will allow MarryTTS to resond to you in the right words :-D"  
   echo ""
   echo "Press [m] for male (Sir resonse), [f] for female (Miss response)"
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
    echo " Get your guns and have fun with your own electronic butler....."
   echo ""
    
  
fi