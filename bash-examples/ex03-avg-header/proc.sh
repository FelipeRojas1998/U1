#!/bin/bash

if [ $# != 1 ]; then
	echo "Uso: $0 <archivo>"
	exit
fi

# Objetivo: calcular el promedio del campo timeEvac del archivo ingresado
# ===> cut -d ':' -f 8 <=== saca el campo #8 (timeEvac)

# ==> Saca el promedio de los datos ingresador a través del STDIN
#  ==> awk 'BEGIN{total=0; count=0} {total+=$1; count+=1;} END {print total/count}' 

#El archivo a procesador tiene una linea header.
# ==>  Hay que eliminarla del procesamiento
# ==> tail -n +2 

prom=$(cat $1 | tail -n +2 | cut -d ':' -f 8 | awk 'BEGIN{total=0; count=0} {total+=$1; count+=1;} END {print total/count}')


printf "Promedio: %.2f\n" $prom