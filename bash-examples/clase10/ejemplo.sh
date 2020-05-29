#!/bin/bash

# La variable $# es equiv a argc
if [ $# != 1 ]; then
	echo "Uso: $0 <directorio busqueda>"
	exit
fi

searchDir=$1

# Falta verificar que searchDir es realmente un directorio
if [ ! -e $searchDir ]; then
        echo "Directorio $1 no existe"
        exit
fi

printf "Directorio busqueda: %s\n" $1
 
#Idea de Jorge Rodriguez
usePhoneFiles=(`find $searchDir -name '*.txt' -print | sort | grep usePhone | grep -v '._'`)


#idea: crear un archivo en donde las columna i-ésima representen la cantidad de personas 
#      que utilizan el teléfono en el instante t=10i.
#      Luego, procesar cada columna para calcular las estadísticas solicitadas

tmpFile="fracaso.txt"
rm -f $tmpFile
for i in ${usePhoneFiles[*]}; 
do	
	printf "> %s\n" $i
	tiempos=(`cat $i | tail -n+3 | cut -d ':' -f 3`)
	for i in ${tiempos[*]};
	do
		printf "%d:" $i >> $tmpFile
	done
	printf "\n" >> $tmpFile
done 

 
