#!/bin/bash

echo "...."
echo "data gets packed for pi....."
echo "(trainings-smples are EXCLUDED)"
echo "...."
echo "please wait"
echo "...."

mkdir packme
cd packme

mkdir -p .kde4/share/apps/simon
mkdir -p .kde4/share/apps/simond
mkdir -p .kde4/share/config/

mkdir -p bin

cd bin 
cp ~/bin/simon ./
sed -i 's/ON_PI="no"/ON_PI="yes"/g' simon
cd ..

mkdir -p .linjark
cd .linjark
cp ~/.linjark/linjark_daemon.sh ./
sed -i 's/ON_PI="no"/ON_PI="yes"/g' linjark_daemon.sh
cd ..

cd .kde4/share/apps/simon/

cp -R ~/.kde4/share/apps/simon/* ./

cd ..

cd ~
cd packme

cd .kde4/share/apps/simond/
cp -R ~/.kde4/share/apps/simond/* ./

cd ~
cd packme

cd .kde4/share/config
cp  ~/.kde4/share/config/simon* ./

cd ~

cd packme
tar -jcf $HOME/unpack_in_home_of_pi.tar.bz2 .kde4

echo ""
echo "unpack the tar.gz in /home/pi and restart simon on the pi"
echo ""
echo "scp unpack_in_home_of_pi.tar.bz2 pi@IP:/home/pi"
echo ""
cd ~
rm -fr packme