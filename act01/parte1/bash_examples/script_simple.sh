#!/bin/bash

BASEDIR=$(readlink -f $0)
BASEDIR=$(dirname $BASEDIR)

dataIn="$BASEDIR/datos.txt"

if [ ! -e $dataIn ]; then
	echo "Error: El archivo $dataIn no existe."
	exit 1
fi

contenido=$(cat $dataIn)

for linea in $contenido; do
	nombre=$(echo $linea | cut -d ':' -f 1 )
	edad=$(echo $linea | cut -d ':' -f 2 )
	estado=$(echo $linea | cut -d ':' -f 3 )
	
	printf "$nombre: $edad, $estado\n"
done
