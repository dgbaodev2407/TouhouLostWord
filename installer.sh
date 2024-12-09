#!/bin/bash
pkg install -y git wget
if [ "$EUID" -ne 0 ];then
	echo "Please run as root"
	sudo bash $(realpath $0) $(realpath $1)
	exit
fi
cd  /data/data/com.termux/files/home/ && git clone https://github.com/dgbaodev2407/TouhouLostWord
wget https://github.com/dgbaodev2407/TouhouLostWord/releases/download/Packages/TouhouLostWordJP.apks -O /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks
settings put global package_verifier_enable 0
pm install /data/data/com.termux/files/home/TouhouLostWord/GameTool.apk
pm install /data/data/com.termux/files/home/TouhouLostWord/Reqable.apk
mkdir -p /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP
cd /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP && unzip /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks
/data/data/com.termux/files/home/TouhouLostWord/sai.sh /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP
echo "Done"
