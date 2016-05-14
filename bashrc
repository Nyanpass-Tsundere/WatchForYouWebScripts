#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

LANG=C

echo 'Prepare firefox for faster loading'
cp -r /usr/lib/firefox /tmp

setterm -powersave off
setterm -powerdown 0

while ! ping -c 1 watching.dd-han.tw;do
	echo Waiting for networking......
	sleep 3
done

while [ "1" ];do
	startx
	echo "Looks Firefox been closed or X11 dead, restarting"
	sleep 3
done
