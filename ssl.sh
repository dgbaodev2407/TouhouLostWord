#!/bin/bash
mount -o remount,rw /
mount -o remount,rw /system
cp $1 /system/etc/security/cacerts
reboot