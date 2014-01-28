#!/usr/local/bin/gnuplot

# set title "Bi2Se3/GaAs"

# Axes ranges 
set xrange [0.437631:0.581742]
set yrange [-0.15:0.15]

# Axes labels
set xlabel ""
set ylabel "E (eV)"

# Axes tics

set xtics ('K/10' 0.4634, 'G' 0.51486025, 'M/10' 0.5550)

set style line 1 linetype 1 linecolor 3 linewidth 3

set size 0.5, 1.0
# set term svg size 2400, 1600 enhanced font 'Helvetica, 30'
# set output "bands.svg"

plot("./bands.dat") using 1:2 with lines lt 1

pause -1

