#!/bin/sh

DEBUG=0

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

SCREEN=`xrandr | grep -w connected | awk -F'[ +]' '{print $1,$3,$4}' | cut -d ' ' -f 2`
SCREEN_X=`echo $SCREEN | cut -d 'x' -f 1`
SCREEN_Y=`echo $SCREEN | cut -d 'x' -f 2`
if [ "$DEBUG" == "1" ]; then
	firefox_X=486 
	firefox_Y=0
	firefox_XW=$((${SCREEN_X}-${firefox_X}))
	firefox_YW=$SCREEN_Y
	exec xterm -geometry 80x66+0+0 -name login &
else
	firefox_X=0
	firefox_Y=0
	firefox_XW=$SCREEN_X
	firefox_YW=$SCREEN_Y
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

echo 'while ! xdotool search --name "Mozilla Firefox";do sleep 1;done ' > afterStart.sh
echo 'sleep 3' >> afterStart.sh
echo 'FFW=`xdotool search --name "Mozilla Firefox"`' >> afterStart.sh
echo 'xdotool windowmove $FFW'" $firefox_X $firefox_Y" >> afterStart.sh
echo 'xdotool windowsize $FFW'" $firefox_XW $firefox_YW" >> afterStart.sh
echo 'xdotool key F11' >> afterStart.sh

/bin/sh afterStart.sh &

fcitx &
/tmp/firefox/firefox `cat targetWeb` 
