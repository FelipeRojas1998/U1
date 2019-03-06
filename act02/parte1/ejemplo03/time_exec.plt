#!/usr/bin/env gnuplot

set encoding utf8

set term png size 800,600
set output "time_exec.png"

set title "Tiempo Ejecución\nHeapsort"
set ylabel "Tiempo[s]"
set xlabel "Tamaño Datos (n)"

set format x "%g"

set grid
set xrange [800000:10200000]
set yrange [0:350]
set xtics 1000000
set ytics 50
set mytics 5

set key outside
#set autoscale x
set samples 20

plot 'time_exec.txt' using 1:2   with linespoints t '' lt 1,\
     'time_exec.txt' using 1:2:3 with yerrorbars  t '' lt 1