#!/bin/bash

OUTFILE="usePhone-stats.txt"


#
# Funciones
#

#
# USO SCRIPT
#
usoScript(){
	echo "Uso: $0 -d search_dir [-h] "
	exit
}

#
# PROMEDIO DE USO DE TELÉFONOS MÓVILES
#	Salida: archivo usePhone-stats.txt con la siguiente estructura
#			timestamp:promedio:min:max
#
#
promedioTelefonosMoviles(){
	#Idea de Jorge Rodriguez, pero mejorada
	# Se realiza una búsqueda recursiva en el directorio ingresado de todos
	# los archivos usePhone-*.txt
	usePhoneFiles=(`find $searchDir -name '*usePhone-*.txt' -print | sort `)


	#idea: crear un archivo en donde las columna i-ésima representen la cantidad de personas 
	#      que utilizan el teléfono en el instante t=10i.
	#      Luego, procesar cada columna para calcular las estadísticas solicitadas

	tmpFile="fracaso.txt"
	> $tmpFile

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

	#Determinar el total de columnas a procesar
		#Sacar la primera linea			: head -1 $tmpFile
		#eliminar el último caracter	: sed 's/.$//' 
		#cambiar todos los ':' por '\n'	: tr ':' '\n'
		#contar las líneas				: wc -l

	totalFields=$(head -1 $tmpFile | sed 's/.$//' | tr ':' '\n'| wc -l)             

	> $OUTFILE
	
	# el archivo tiene una linea de cabecera, que comienza con '#'
	printf "#timestamp:promedio:min:max\n" >> $OUTFILE
	for i in $(seq 1 $totalFields); do
		out=$(cat $tmpFile | cut -d ':' -f $i |\
			awk 'BEGIN{ min=2**63-1; max=0}\
				{if($1<min){min=$1};if($1>max){max=$1};total+=$1; count+=1;}\
				END {print total/count":"max":"min}')
		printf "$i:$out\n" >> $OUTFILE
	done

	rm $tmpFile
}


#
# MAIN
#
while getopts "d:h" opt; do
  case ${opt} in
    d ) 
		searchDir=$OPTARG
      ;;
    h )
		usoScript
      ;;
    \? ) 
		usoScript
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z $searchDir ]; then
	usoScript
fi

if [ ! -d $searchDir ]; then
        echo "$searchDir no es un directorio"
        exit
fi

printf "Directorio busqueda: %s\n" $searchDir


#Determinar promedio de uso de teléfonos móviles
promedioTelefonosMoviles

 


