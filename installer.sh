#!/bin/bash
pkg install -y git
git clone https://github.com/dgbaodev2407/TouhouLostWord
wget https://github.com/dgbaodev2407/TouhouLostWord/releases/download/Packages/TouhouLostWordJP.apks
cp TouhouLostWordJP.apks /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks
settings put global package_verifier_enable 0
pm install /data/data/com.termux/files/home/TouhouLostWord/GameTool.apk
pm install /data/data/com.termux/files/home/TouhouLostWord/Reqable.apk
pm install /data/data/com.termux/files/home/TouhouLostWord/MiX.apk
/data/data/com.termux/files/home/TouhouLostWord/sai.sh /data/data/com.termux/files/home/TouhouLostWord/TouhouLostWordJP.apks
echo "Done"
