#!/bin/sh

cd `dirname $0`

cp '10-monitor.conf' /etc/X11/xorg.conf.d/ && echo 'using root!!' || echo 'Please using root run cp 10-monitor.conf /etc/X11/xorg.conf.d/ or moniter will close after 30 minutues'
cp bashrc ~/.bashrc
cp xinitrc ~/.xinitrc
read -p 'What Website will open after network standby: ' web
echo $web > ~/targetWeb
