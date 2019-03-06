#!/usr/bin/env gnuplot

set encoding utf8
set term png size 800,600

set autoscale x
set grid

set key top right 
set key title "Series" 

set title "Título Grafico" 

set output "ejemplo.png"

set xlabel "x-label"
set ylabel "y-label"
set ytics 0.1
set format y "%g"
set format x "%g"
set xrange [0:80]
set xtics 10
set mxtics 10

set style line 1  lw 1 pt 5
set style line 2  lw 1 pt 9

plot 'ejemplo.txt' using 1:2 with linespoints t 'serie 1' ls 1, \
     'ejemplo.txt' using 1:3 with linespoints t 'serie2' ls 2

