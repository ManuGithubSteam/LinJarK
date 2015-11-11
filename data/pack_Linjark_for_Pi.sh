#!/bin/bash

mkdir packme
cd packme

mkdir -p .kde4/share/apps/simon/model/base
mkdir -p .kde4/share/apps/simon/model/

cd .kde4/share/apps/simon/model/base

cp ~/.kde4/share/apps/simon/model/base/* ./

cd ..

cp ~/.kde4/share/apps/simon/model/* ./
rm prompts
rm prompts_back
rm fix_names.py

cd ~
cd packme

tar -zcvf $HOME/unpack_in_home_of_pi.tar.gz .kde4

echo ""
echo "unpack the tar.gz in /home/pi and restart simon on the pi"
echo ""

cd ~
rm -fr packme