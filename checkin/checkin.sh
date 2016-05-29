#!/bin/sh
HOST=$(hostname --long)

touch /tmp/$HOST
uptime -p > /tmp/$HOST
sudo -u hello scp -i /home/hello/.ssh/id_rsa /tmp/$HOST uganda@hellohub.org:/home/kiosk/public_html/status/updates/$HOST
rm /tmp/$HOST
