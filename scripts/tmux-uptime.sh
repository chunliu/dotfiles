#!/bin/bash

uptimestr=$(uptime)

if [ "$1" == "-l" ]
then
	agvload=${uptimestr##*average:}
	echo $agvload
else
	uptime1=${uptimestr##*up}
	uptime2=${uptime1%%users*}
	uptime3=${uptime2%,*}
	echo $uptime3
fi

