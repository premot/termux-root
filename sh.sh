if busybox pgrep -f com.termux.x11 >1; then 
	echo "running" 
else 
	exit 1 
fi

#busybox kill $(busybox pgrep -f com.termux.x11)

ps
lsof
am
pm
fusermount
svc
pkill
setprop
setprop sys.powerctl reboot
setprop ctl.stop media
setprop ctl.stop zygote


