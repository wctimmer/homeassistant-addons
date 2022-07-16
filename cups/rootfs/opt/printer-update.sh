#!/bin/sh
/usr/bin/inotifywait -m -e close_write,moved_to,create /etc/cups | 
while read -r directory events filename; do
	if [ "$filename" = "printers.conf" ]; then
		rm -rf /data/services/AirPrint-*.service
		/opt/airprint-generate.py -d /data/services
		cp /etc/cups/printers.conf /data/config/printers.conf
		rsync -avh /data/services/ /etc/avahi/services/
	fi
done
