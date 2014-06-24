#!/usr/local/bin/gnuplot

set title "TI/metal"

# Axis ranges
  set xrange [0.437631:0.581742]
  set yrange [-0.15:0.15]

# Axis labels
  set xlabel ""
  set ylabel "E (eV)" font 'Arial, 20'

# Axis tics
  set xtics ('K/10' 0.4634, 'G' 0.51486025, 'M/10' 0.5550) font 'Arial, 20'
  set ytics ( -0.15, -0.10, -0.05, 0.00, 0.05, 0.10, 0.15 ) font 'Arial, 20'

# Borders line width

  set border linewidth 1.5

  set style line 1 linetype 1 linecolor 3 linewidth 3
  set style line 2 linetype 1 linecolor rgb "grey" linewidth 3

  set size 0.5, 1.0
#  set term svg size 1924, 1080 enhanced font 'Helvetica, 30'
#  set output "bands.svg"

  plot("./bands.dat") using 1:2 with lines title "" linestyle 1

pause -1

