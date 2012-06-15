#!/sbin/sh

# DooMLoRD: autoroot script (v13)

# [START] setting up
echo "[START] remounting system" > /data/local/tmp/autorootlog.txt
/sbin/busybox mount -o remount,rw /system >> /data/local/tmp/autorootlog.txt

# [CHECK] searching if autoroot was done before
echo "[CHECK] searching for autorooted file " >> /data/local/tmp/autorootlog.txt
if /sbin/busybox [ ! -f /system/autorooted ]; 
then
	echo "[FOUND] autorooted file " >> /data/local/tmp/autorootlog.txt

	# [CHECK] verify /system/xbin
	echo "[CHECK] verifying /system/xbin " >> /data/local/tmp/autorootlog.txt
	/sbin/busybox mkdir /system/xbin
	/sbin/busybox chmod 755 /system/xbin

	# [SU binary] remove existing occurances and push su
	echo "[SU binary] remove existing occurances and push su" >> /data/local/tmp/autorootlog.txt
	/sbin/busybox rm /system/bin/su
	/sbin/busybox rm /system/xbin/su
	/sbin/busybox cp /res/autoroot/su /system/xbin/su
	/sbin/busybox chown root.root /system/xbin/su
	/sbin/busybox chmod 06755 /system/xbin/su

	# [Superuser app] remove existing occurances and push app
	echo "[Superuser app] remove existing occurances and push app" >> /data/local/tmp/autorootlog.txt
	/sbin/busybox rm /system/app/Superuser.apk
	/sbin/busybox rm /data/app/Superuser.apk
	/sbin/busybox cp /res/autoroot/Superuser.apk /system/app/Superuser.apk
	/sbin/busybox chown root.root /system/app/Superuser.apk
	/sbin/busybox chmod 0644 /system/app/Superuser.apk

	# [busybox binary] remove existing occurances and push busybox
	echo "[busybox binary] remove existing occurances and push busybox" >> /data/local/tmp/autorootlog.txt
	if /sbin/busybox [ ! -f /system/xbin/busybox ]; 
	then	
		echo "[busybox binary] not found in /system/xbin/busybox " >> /data/local/tmp/autorootlog.txt
		if /sbin/busybox [ ! -f /system/bin/busybox ]; 
		then	
			echo "[busybox binary] not found in /system/bin/busybox " >> /data/local/tmp/autorootlog.txt
			/sbin/busybox cp /res/autoroot/busybox /system/xbin/busybox
			/sbin/busybox chown root.root /system/xbin/busybox
			/sbin/busybox chmod 4777 /system/xbin/busybox
			/system/xbin/busybox --install -s /system/xbin/
		fi
	fi

	# [DONE] placing flag
	echo "[DONE] placing flag" >> /data/local/tmp/autorootlog.txt
	/sbin/busybox touch /system/autorooted 

else

	echo "[FOUND] autorooted file" >> /data/local/tmp/autorootlog.txt
	echo "Device has been already autorooted" >> /data/local/tmp/autorootlog.txt
	echo "nothing to do... bye bye..." >> /data/local/tmp/autorootlog.txt

fi;

# [DONE] all done exiting
echo "[DONE] all done exiting" >> /data/local/tmp/autorootlog.txt
