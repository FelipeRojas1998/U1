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

rm -f fracaso.txt
for i in ${usePhoneFiles[*]}; 
do	
	printf "> %s\n" $i
	tiempos=(`cat $i | tail -n+3 | cut -d ':' -f 3`)
	for i in ${tiempos[*]};
	do
		printf "%d:" $i >> fracaso.txt
	done
	printf "\n" >> fracaso.txt
	
done 

 
