#!/system/bin/sh

# Split APKs Installer | SAI #
: '
This script allows you to install splits-apk with one adb shell command! push this script to your device with adb and run it:
usage: sh sai.sh [path/to/folder/with/the/apks] [installer pkg (optional)] [originating-uri (optional)] 
example: sh sp_installer.sh "/data/local/tmp/wa_app/" "com.android.vending" "171faa8c8918"
Author: David Lev (github.com/david-lev)
'
echo "<<< Split APKs Installer | github.com/david-lev >>>\n"
# vars & args
if [[ -n ${1} ]]; then folder=${1}; else echo "PATH to apk's directory must be provided!" && exit 1; fi
[[ -z ${2} ]] || installer="-i ${2}"
[[ -z ${3} ]] || token="--originating-uri ${3}"
totalsize=0
index=0

# get total size of the splits
for size in $(ls -l ${folder}/*apk | tr -s ' ' | cut -d ' ' -f 5) ; do
  totalsize=$(( ${totalsize} + ${size} ))
done

# create new session
echo "Creating new session..."
output=$(pm install-create ${installer} ${token} -S ${totalsize})
[[ ${?} != 0 ]] && echo "failed to create session." && exit 1
session_id=$(sed -n 's/.*\[\([0-9]*\)\]/\1/p' <<< ${output})
echo "Session created: ${session_id}"

# write splits into the session
for apk in ${folder}/*apk; do
    file_size=$(ls -l ${apk} | tr -s ' ' | cut -d ' ' -f 5)
    echo "\nWriting ${apk}: ${file_size}"
    pm install-write -S ${file_size} ${session_id} ${index} ${apk}
    [[ ${?} != 0 ]] && echo "\nFailed to write the file." && exit 1
    index=$(( ${index} + 1 ))
done

# commit and install
echo "\nInstalling..."
if (pm install-commit ${session_id}); then
  echo "\nInstallation success!"
else
  echo "\nInstallation failed." && exit 1
fi