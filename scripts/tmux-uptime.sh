#!/bin/bash

uptimestr=$(uptime)

if [ "$1" == "-l" ]
then
	echo ${uptimestr##*average:}
else
	uptime1=${uptimestr##*up}
	echo ${uptime1%,*users*}
fi

