#!/bin/bash

if [ $# != 1 ]
then
	echo "Uso: $0 <archivo>"
	exit
fi

cmd=$(cat $1 | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
												  if($1>max){max=$1};\
												  total+=$1; count+=1;\
											    } \
											 	END { print total/count, max, min}')

echo $cmd

