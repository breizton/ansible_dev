#!/bin/bash

#version corrected by Cristi Dita 24/10/2016
DATE="$(date +%Y-%m-%d)"
LOGFILE="/var/log/cpu_$DATE.log"
TIMESTAMP="$(date +%H:%M)"
TOPDELAY="5"

CPU_LOAD="$(top -b n2 -d$TOPDELAY | grep "Cpu(s)" | \
                sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
                awk '{print $2 + $3 + $4 + $6}')"

REAL_CPU_LOAD=$(echo $CPU_LOAD | awk '{print $2 "%"}')

echo $TIMESTAMP " " $REAL_CPU_LOAD >> $LOGFILE


echo $(date +%Y-%m-%d:%H:%M:%S) >> /var/log/free_$DATE.log
free -g >> /var/log/free_$DATE.log

exit
