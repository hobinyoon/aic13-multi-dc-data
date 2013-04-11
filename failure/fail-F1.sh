#! /usr/bin/env bash
set -e
set -u

echo "Letting YCSB stabilize; sleeping 60 .."
sleep 60

while [[ 1 ]]
do
	echo "Stopping Cassandra .."
	./driver cstop
	echo "Sleeping 15 .."
	sleep 15
	echo "Resuming Cassandra .."
	./driver cresume
	echo "Sleeping 60 .."
	sleep 60
done
