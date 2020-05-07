#!/bin/bash

if [ $# != 1 ]; then
	echo "Uso: $0 <archivo>"
	exit
fi

# Objetivo: calcular el promedio del campo timeEvac del archivo ingresado,
# solo de los que están en la safeZone Z2

# ==> saca el campo #8 (timeEvac)
# ===> cut -d ':' -f 8

# ==> selecciona los registros que contienen Z2
# ==> grep Z2

# ==> Saca el promedio de los datos ingresador a través del STDIN
#  ==> awk 'BEGIN{total=0; count=0} {total+=$1; count+=1;} END {print total/count}' 

#El archivo a procesador tiene una linea header.
# ==>  Hay que eliminarla del procesamiento
# ==> tail -n +2 

prom=$(cat $1 | tail -n +2 |grep Z2| cut -d ':' -f 8 | awk 'BEGIN{total=0; count=0} {total+=$1; count+=1;} END {print total/count}')


printf "Promedio: %.2f\n" $prom