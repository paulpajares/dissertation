#!/bin/bash
echo "Start query DNS"
file="domainlist.txt"
echo "Output IP" > outIP.txt
echo "Output HTTP Response" > outHTTP.txt
while read -r line;
	do
	echo "Fetching.."
	echo "$line"
	hostIP=`dig $line +short A`
	echo "$line $hostIP" >> outIP.txt
	httpResponse=`curl -ILv --no-tcp-nodelay $line`
	echo "$line $httpResponse" >> outHTTP.txt
	done < $file
