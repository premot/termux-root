neofetch
if pgrep vncserver >/dev/null; then
	echo "vncserver running"
else
	vncserver -localhost no &
	/usr/sbin/sshd -D &
fi
#
#if pgrep xfce4-terminal >/dev/null; then
#	echo "terminal running"
#else
#	xfce4-terminal
#fi
