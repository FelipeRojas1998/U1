#!/bin/bash

if [ $# != 1 ]; then
	echo "Uso: $0 <archivo>"
	exit
fi

# Calcular el promedio del campo #3
prom=$(cat $1 | cut -d ':' -f 3 | awk 'BEGIN{total=0; count=0} {total+=$1; count+=1;} END {print total/count}')

printf "Promedio: %.2f\n" $prom