# start X on tty1
[ "$TTY" = /dev/tty1 ] && startx "$UID" && logout
