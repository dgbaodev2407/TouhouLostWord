#!/data/data/com.termux/files/usr/bin/bash
if [ "$EUID" -ne 0 ];then
	echo "Please run as root"
	sudo bash $(realpath $0) $1
	exit
fi
termux-wake-lock
deviceid=$1
php /data/data/com.termux/files/home/TouhouLostWord/live.php