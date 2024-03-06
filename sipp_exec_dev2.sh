#!/bin/bash

#User settings:
CALLS=99
RemoteIp=10.16.43.220
LocalIp=10.16.43.217

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


./sipp \
 $RemoteIp:5060 \
 -t t1 \
 -p 5060 \
 -sf Azure_AM_DM_G711_SBC.xml\
 -cp 8883 \
 -l $CALLS \
 -r 1800 \
 -rp 3600000 \
 -mi $LocalIp \
 -i $LocalIp \
 -d 196s \
 -inf 5000000.csv \
 -aa \
 --trace_err --trace_stat \
 -trace_screen \
 -min_rtp_port 33060 \
 -max_rtp_port 35060 \
 -max_reconnect 100000 \
 -reconnect_close false \
 -max_recv_loops 100000 \
 -oocsn ooc_default \
 -skip_rlimit \
 -reconnect_sleep 300 \
 -rtp_threadtasks 10000 \
 -rtp_buffsize 10000000000 \
 -buff_size 1000000000 \
 -watchdog_minor_threshold 1500


