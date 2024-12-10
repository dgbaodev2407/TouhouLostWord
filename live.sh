#!/bin/bash
if [ "$EUID" -ne 0 ];then
	echo "Please run as root"
	sudo bash $(realpath $0) $1
	exit
fi
deviceid=$1
php /data/data/com.termux/files/home/live.php