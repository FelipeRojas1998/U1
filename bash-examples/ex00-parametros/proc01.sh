#!/bin/bash

# 1ra prueba
#miIP=$(ifconfig |grep "inet " |grep -v 127 | cut -d ' ' -f 2)
#
#printf "La IP es %s\n" $miIP

if [ $# != 1 ]; then
	echo "Uso: $0 <archivo de datos>"
	exit
fi

# El nombre del archivo está en $1
# Objetivo: promediar el campo 'distanceToTargetPos'  del archivo $1


# cat summary.txt | tail -n +2  | cut -d ':' -f 6 | awk 'BEGIN{total=0; count=0} {total+=$1; count+=1} END{print total/count}'

if [ ! -e $1 ]; then
	echo "El archivo $1 no existe"
	exit
fi


avgDistanceToTargetPos=$(cat $1 | tail -n +2  | cut -d ':' -f 6 | \
								awk 'BEGIN{total=0; count=0} {total+=$1; count+=1} END{print total/count}')


echo "El promedio bla bla bla: $avgDistanceToTargetPos"



