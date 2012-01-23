#!/sbin/sh

# DooMLoRD: init.d support script (v1)

# [START] setting up
echo "[START] remounting system" > /data/local/tmp/sysinitsupportlog.txt
/sbin/busybox mount -o remount,rw /system >> /data/local/tmp/sysinitsupportlog.txt

# make init.d directory
echo "[*] make init.d directory" >> /data/local/tmp/sysinitsupportlog.txt
/sbin/busybox mkdir -p /system/etc/init.d >> /data/local/tmp/sysinitsupportlog.txt

# correcting permissions of files in init.d directory
echo "[*] correcting permissions of files in init.d directory" >> /data/local/tmp/sysinitsupportlog.txt
/sbin/busybox chmod 777 /system/etc/init.d/*

# make init.d directory
echo "[*] make init.d directory" >> /data/local/tmp/sysinitsupportlog.txt
/system/bin/logwrapper /sbin/busybox run-parts /system/etc/init.d

# [DONE] all done exiting
echo "[DONE] all done exiting" >> /data/local/tmp/sysinitsupportlog.txt
