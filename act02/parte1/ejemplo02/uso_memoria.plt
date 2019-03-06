#!/usr/bin/env gnuplot

set encoding iso_8859_1

set term png size 640,480
set output "uso_memoria.png"

set title "Costo Espacial"
set ylabel "Memoria utilizada[MB]"
set xlabel "Cantidad de Agentes (x10.000)"

set key top left 
set key title "Código" 

set grid

set xrange [5:105]
set yrange [0:*]
set xtics 10
set ytics 50
set mytics 5

set datafile separator ":"

plot "uso_memoria.txt"  using 1:2 title "Versión 1"  with linespoints lt -1 lw 1 pointtype 5 pointsize 1, \
	 "uso_memoria.txt"  using 1:3 title "Versión 2"  with linespoints lt -1 lw 1 pointtype 10 pointsize 1
