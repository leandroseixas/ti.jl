#!/usr/bin/gnuplot

# set title "Bi2Se3/GaAs"

set xrange [0.437631:0.581742]
set yrange [-0.15:0.15]

set size 0.5, 1.0
# set term svg size 1920, 1080 enhanced font 'Helvetica, 30'
# set output "bands.svg"

plot("./bands.dat") using 1:2 with lines

pause -1

