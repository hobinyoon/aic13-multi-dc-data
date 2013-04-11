#! /usr/bin/env bash
set -e
set -u

sleeptime=120

echo "Letting YCSB stabilize; sleeping $sleeptime .."
sleep $sleeptime

while [[ 1 ]]
do
	echo "Stopping Cassandra .."
	./driver cstop
	echo "Sleeping $sleeptime .."
	sleep $sleeptime
	echo "Resuming Cassandra .."
	./driver cresume
	echo "Sleeping $sleeptime .."
	sleep $sleeptime
done
