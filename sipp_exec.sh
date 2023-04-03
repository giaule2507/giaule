#!/bin/bash

#User settings:
CALLS=1500
RemoteIp=10.200.19.21
LocalIp=10.200.19.10

if [ -n "$1" ]
then
        Calls=$1
fi

if [ "$RemoteIp" = "" ]
then
	echo "Remote IP must be set."
	exit 1;
fi

if [ "$LocalIp" = "" ]
then
        echo "Local IP must be set."
        exit 1;
fi



rm -f *.log


sipp \
 $RemoteIp:5060 \
 -t tn \
 -p 5072 \
 -sf sipp_to_agent_tarts_handle183.xml\
 -m $CALLS \
 -l $CALLS \
 -r 13500 \
 -rp 3600000 \
 -mi $LocalIp \
 -i $LocalIp \
 -inf database_3Kuser_sipp1_skill_112.csv \
 -aa \
 --trace_err --trace_msg \
 -trace_screen \
 -watchdog_minor_threshold 1500

