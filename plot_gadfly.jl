#!/usr/bin/env julia

##
# Plot graph with Gadfly (Julia)
#

using DataFrames
using Gadfly
using Color

bands = readtable("bands.csv")

function multiplot(df, x, ys, args...)
  plot( df, tuple( [ layer(x=x, y=yi, args...) for yi=ys ]... )... )
end

mp = multiplot(bands, 1, 2:5,
Scale.x_continuous(minvalue=0.437631, maxvalue=0.581742), Scale.y_continuous(minvalue=-0.15, maxvalue=0.15),
Theme(default_color=color("#0033ff"), panel_fill=color("#efefef"), grid_color=color("#fefefe")),
Geom.line)

draw(PDF("bands.pdf", 10cm, 10cm), mp)
