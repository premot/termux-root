if busybox pgrep -f com.termux.x11 >1; then 
	echo "running" 
else 
	exit 1 
fi

#busybox kill $(busybox pgrep -f com.termux.x11)


