#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ "`tty`" == "/dev/tty1" ]; then
	LANG=C
	
	echo 'Prepare firefox for faster loading'
	cp -r /usr/lib/firefox /tmp
	
	setterm -powersave off
	setterm -powerdown 0
	
	while ! curl `cat targetWeb` > /dev/null ;do
		echo Waiting for networking......
		sleep 3
	done

	source /etc/locale.conf

	while [ "1" ];do
		startx
		echo "Looks Firefox been closed or X11 dead, restarting"
		sleep 3
	done
fi

if [ "`tty | cut -d'/' -f 3 | sed s/[0-9]//g` == "tty ]; then
	LANG=C
fi
