#!/bin/sh
mount /dev/block/mmcblk1p4 /data/local/tmp/pimount &
am start -n com.termux.x11/.MainActivity &

# The path of Ubuntu rootfs

UBUNTUPATH="/data/local/tmp/pimount"


export TMPDIR=$UBUNTUPATH/tmp
export CLASSPATH=$(/system/bin/pm path com.termux.x11 | cut -d: -f2)
/system/bin/app_process / com.termux.x11.CmdEntryPoint :0 &


# Fix setuid issue

busybox mount -o remount,dev,suid /data



busybox mount --bind /dev $UBUNTUPATH/dev

busybox mount --bind /sys $UBUNTUPATH/sys

busybox mount --bind /proc $UBUNTUPATH/proc

busybox mount -t devpts devpts $UBUNTUPATH/dev/pts



# Mount sdcard

#busybox mount --bind /sdcard $UBUNTUPATH/sdcard



# chroot into Ubuntu

busybox chroot $UBUNTUPATH /bin/su - root



# Umount everything after exit

#busybox umount $UBUNTUPATH/dev/pts

#busybox umount $UBUNTUPATH/dev

#busybox umount $UBUNTUPATH/proc

