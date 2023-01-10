#!/bin/bash
rm secret.txt
if [ "$1" == "" ]; then
	echo "You must supply a password for pihole"
	exit 1
else
	echo $1 >secret.txt
fi
docker build --no-cache -t pihole.mgamlem3.base .
if [ "$2" != "replica" ]; then
	docker build --no-cache -t pihole.mgamlem3.primary -f Dockerfile.primary .
fi
if [ "$2" != "primary" ]; then
	docker build -t pihole.mgamlem3.replica -f Dockerfile.replica .
fi
