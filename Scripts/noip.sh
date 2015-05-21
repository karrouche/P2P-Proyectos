#! /bin/bash
#Mohamed Mohand Karrouche
#Instalación de NO-IP
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
tar -zxf noip-duc-linux.tar.gz
cd noip-2.1.9-1/
make
sudo make install
cd ..
rm -r noip-duc-linux.tar.gz
