#!/bin/sh



# The path of Ubuntu rootfs

UBUNTUPATH="/data/data/com.termux/files/home/ubu/pimount"



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

