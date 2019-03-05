# Actividad 01
Implementar un script BASH que permita obtener los N permisos de circulación más caros. Debe mostrar los siguientes datos:

* Marca, Modelo, Versión
* Año
* Tasación fiscal
* Permiso de circulación

La ruta del archivo de datos debe ser ingresado como parámetro, al igual que la cantidad de permisos a obtener. El archivo de datos a utilizar es ```liv2019.csv```.

## Ejemplo de ejecución

Consultar el archivo localizado en ```Ruta/al/archiov/liv2019.csv``` y obtener los 4 permisos más caros.

```
./querydata -f /Ruta/al/archiov/liv2019.csv -N 4
```

Salida esperada (extracto):

```
Modelo  : MCLAREN P1 SIN VERSION
Año     : 2015
Tasación: $ 431090000
Permiso : $  19094426
=================================
Modelo  : PORSCHE 918 SPYDER WEISSACH PACKAGE
Año     : 2016
Tasación: $ 355100000
Permiso : $  15674876
...
...
...
```

