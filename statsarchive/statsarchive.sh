#!/bin/sh
HOST=$(hostname --long)

rm -r /tmp/mon
mkdir /tmp/mon
wget -O /tmp/mon/index.html "http://localhost:8080/monitorix-cgi/monitorix.cgi?mode=localhost&graph=all&when=1week&color=white"
mkdir /tmp/mon/imgs
cp -r /var/lib/monitorix/www/imgs/* /tmp/mon/imgs/
sed -i 's/http:\/\/localhost:8080\/monitorix\/imgs\//.\/imgs\//g' /tmp/mon/index.html
sed -i "s/localhost/$HOST/g" /tmp/mon/index.html
sudo -u hello scp -i /home/hello/.ssh/id_rsa -r /tmp/mon/* monitor@hellohub.org:/home/monitor/public_html/$HOST/
rm -r /tmp/mon
