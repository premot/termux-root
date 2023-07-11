#!/bin/sh

if ! mountpoint -q /data/local/tmp/pimount; then
	mount /dev/block/mmcblk1p4 /data/local/tmp/pimount
else
	echo "sd card partition 4 mounted already"
fi


if busybox pgrep -f com.termux.x11 >1; then
        echo "x11 client running already"
else
	am start -n com.termux.x11/.MainActivity &
fi


# path to the dir of mounted filesystems root

ROOTFSPATH="/data/local/tmp/pimount"


export TMPDIR=$ROOTFSPATH/tmp
export CLASSPATH=$(/system/bin/pm path com.termux.x11 | cut -d: -f2)
/system/bin/app_process / com.termux.x11.CmdEntryPoint :0 &


# Fix setuid issue

busybox mount -o remount,dev,suid /data



busybox mount --bind /dev $ROOTFSPATH/dev

busybox mount --bind /sys $ROOTFSPATH/sys

busybox mount --bind /proc $ROOTFSPATH/proc

busybox mount -t devpts devpts $ROOTFSPATH/dev/pts



# Mount sdcard

#busybox mount --bind /sdcard $ROOTFSPATH/sdcard



# chroot into Ubuntu

busybox chroot $ROOTFSPATH /bin/su - root



# Umount everything after exit

#busybox umount $ROOTFSPATH/dev/pts

#busybox umount $ROOTFSPATH/dev

#busybox umount $ROOTFSPATH/proc

