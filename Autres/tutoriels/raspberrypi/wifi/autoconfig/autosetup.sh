#!/bin/bash
# Autosetup.sh
# 
# Autoconfigure Wi-fi on Windows WPA-PEAP
#
# By Alexis Paques
#

show_title() {
	clear
	echo ""
	echo ""
	echo "----------------------------------------------"
	echo "    $1"
	echo "----------------------------------------------"
	echo ""
}

show_title "Configure wifi by Alexis Paques" 
echo -n "Please enter your ECAM username: "
read username
username=$($username)@ecam.be
echo -n "Please enter your ECAM password: "
read password
echo "#####################################"
echo "##     Searching WPA_Supplicant    ##"
if [ -f /etc/wpa_supplicant/wpa_supplicant.conf ] then
	conf=/etc/wpa_supplicant/wpa_supplicant.conf
elif [ -f /etc/wpa_supplicant.conf ] then
	conf=/etc/wpa_supplicant.conf
else
	conf=~/
	echo "ERROR: did you install wpa_supplicant?"
	exit
fi
echo "Found in $conf"

echo "##       Searching interfaces      ##"
if [ -f /etc/wpa_supplicant/network/interfaces ] then
	interfaces=/etc/wpa_supplicant/network/interfaces
else
	interfaces=~/
	echo "ERROR: interfaces NOT found"
	exit
fi
echo "Found in $interfaces"
echo "##      Backup in ~/.backup/       ##"
cp -f $conf $interfaces ~/.backup/
echo "##         Deleting files          ##"
rm -f $conf $interfaces
echo "##     Creating temporary file     ##"
echo "##       Generating new file       ##"
echo "##         adding username         ##"
sed "s/###username###/$username/" wpa_supplicant.conf.bak > wpa_supplicant.conf.bak1
sleep 1
echo "##         adding password         ##"
sed "s/###password###/$password/" wpa_supplicant.conf.bak1 > $conf
sleep 1
cp interfaces $interfaces
echo "##       adding permissions        ##"
sudo chmod a+x $conf
sudo chmod a+x $interfaces
echo "##        Deleting tmp file        ##"
rm -f wpa_supplicant.conf.bak1
echo "#####################################"
sleep 1