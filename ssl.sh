#!/bin/bash
if [ "$EUID" -ne 0 ];then
	echo "Please run as root"
	sudo bash $(realpath $0) $(realpath $1)
	exit
fi
mount -o remount,rw /
mount -o remount,rw /system
cp $1 /system/etc/security/cacerts
reboot