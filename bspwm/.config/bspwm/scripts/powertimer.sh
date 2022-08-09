#!/bin/bash

while getopts s:h: option
do
case "${option}"
in
h) SHUT=${OPTARG};;
s) SUSP=${OPTARG};;
esac
done

if [ ! -z ${SHUT+x} ];
then echo "Shutdown in $SHUT min";
sleep ${SHUT}m
sudo shutdown -h now
fi

if [ ! -z ${SUSP+x} ];
then echo "Suspend in $SUSP min";
sleep ${SUSP}m
sudo pm-suspend
fi
