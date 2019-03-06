#!/usr/bin/env perl

use strict;
use Time::HiRes qw( usleep ualarm gettimeofday tv_interval clock_gettime clock_getres clock);
use Getopt::Long;
use Pod::Usage;
use Getopt::Long;
use Pod::Usage;

my $DEBUG = 0;

my @DATOSORIGINALES;
my @DATOSORDENAR;
my @DATOSORDENADOS;
my $OPERACIONES;

main: {
    my $elapsed;
    my $total_datos;

    my @tiempos;
    my $range = 1000000000;

    GetOptions ("size=i" => \$total_datos,
                "debug" => \$DEBUG
               );

    die "$0 requiere el tamano de los datos (--size)\n" unless $total_datos;

    srand(114);
    @DATOSORIGINALES = ();
    for (my $i = 0; $i < $total_datos; $i++) {
        push @DATOSORIGINALES, int(rand($range));
    }

    $elapsed = experimento();
    print "Datos:Tiempo:Operaciones\n";
    print "$total_datos:$elapsed:$OPERACIONES\n";

    exit();
}

#
# Funcion que inicia el experimento
#

sub experimento {

    my $t0;
    my $elapsed;

    @DATOSORDENAR = @DATOSORIGINALES;
    @DATOSORDENADOS = ();

    $t0 = [gettimeofday];
    $OPERACIONES = 0;
    heapSort();
    $elapsed = tv_interval ( $t0, [gettimeofday]);

    print join "\n", @DATOSORDENADOS, "\n" if $DEBUG == 1;

return($elapsed);
}


#
# Algoritmo de ordamiento
# Entrada:  @DATOSORDENAR
# Salida :  @DATOSORDENADOS
#

sub heapSort {
    my $n = scalar @DATOSORDENAR;
    my $i;

# Construir el heap en base a los datos originales
    for ($i = int($n/2)-1; $i >= 0; $i--) {
        heapify($i);
    }

#Extraer uno por uno
    for ($i = $n-1; $i >= 0; $i--) {
#Mover el raiz al final
        swap(0,$i);

#Saco el ultimo elemento y lo agrego a @DATOSORDENADOS
        unshift @DATOSORDENADOS, pop @DATOSORDENAR;

        heapify(0);
    }
}

#
# Funcion de apoyo: heapify
# Entrada:  $i : nodo root del subarbol a mantener el heap.
#           @DATOSORDENAR
#

sub heapify {
    my $i = shift;
    my $n = scalar @DATOSORDENAR;

    my ($mayor, $izq, $der);

    $mayor = $i;
    $izq   = 2*$i + 1;
    $der   = 2*$i + 2;

    $OPERACIONES += 3;

#Si el nodo de la izquierda es mayor que el raiz
    if ($izq < $n && $DATOSORDENAR[$izq] > $DATOSORDENAR[$mayor]) {
        $mayor = $izq;
    }
    $OPERACIONES += 1;

#Si el nodo de la derecha es mayor que el raiz
    if ($der < $n && $DATOSORDENAR[$der] > $DATOSORDENAR[$mayor]) {
        $mayor = $der;
    }
    $OPERACIONES += 1;

#Si el mayor no es el raiz
    if ($mayor != $i) {
        swap($i, $mayor);
        heapify($mayor);
    }
}

#
# $DATOSORDENAR[$i] <-> $DATOSORDENAR[$j]
#
sub swap {
    my $i = $_[0];
    my $j = $_[1];

    my $aux;

    $aux = $DATOSORDENAR[$j];
    $DATOSORDENAR[$j] = $DATOSORDENAR[$i];
    $DATOSORDENAR[$i] = $aux;

    $OPERACIONES += 3;
}

