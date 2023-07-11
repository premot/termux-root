#sh script.sh
#/usr/sbin/sshd -D &

if pgrep -x "xfwm4" >/dev/null; then
	return 1
else
./display
fi
#export DISPLAY=:0 &

#termux-x11 :0 &

#dbus-launch --exit-with-session startxfce4 &
