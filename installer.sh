#!/bin/bash
# pkg install -y git
cd  /data/data/com.termux/files/home/ && git clone https://github.com/dgbaodev2407/TouhouLostWord
wget https://github.com/dgbaodev2407/TouhouLostWord/releases/download/Packages/TouhouLostWordJP.apks -O /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks
while [ ! -f /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks];do
	wget https://github.com/dgbaodev2407/TouhouLostWord/releases/download/Packages/TouhouLostWordJP.apks -O /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks;
done
settings put global package_verifier_enable 0
pm install /data/data/com.termux/files/home/TouhouLostWord/GameTool.apk
pm install /data/data/com.termux/files/home/TouhouLostWord/Reqable.apk
/data/data/com.termux/files/home/TouhouLostWord/sai.sh /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks
echo "Done"
