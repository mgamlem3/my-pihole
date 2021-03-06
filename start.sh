#!/bin/bash
if [ "$1" == "" ]; then
	echo "You must specify which variant to start: primary or replica"
	exit 1
elif [ "$1" == "primary" ]; then
	docker run -d -p 53:53/tcp -p 53:53/udp -p 80:80 -v pihole:/etc/pihole -v dnsmasq:/etc/dnsmasq.d --restart=unless-stopped --name pihole.mgamlem3.primary pihole.mgamlem3.primary
	exit 0
elif [ "$1" == "replica" ]; then
	docker run -d -p 53:53/tcp -p 53:53/udp -p 80:80 -v pihole:/etc/pihole -v dnsmasq:/etc/dnsmasq.d --restart=unless-stopped --name pihole.mgamlem3.replica pihole.mgamlem3.replica
	exit 0
else
	exit 1
fi
