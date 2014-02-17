##
# k-points path
#
#  file: lib/kpoints.jl
#
# Import: k_paths
# Export: k_cartesian, k_cumsum

  println(STDOUT, "\tSetting path in Brillouin zone.")

  tic()

  reciprocal = 2pi*inv(bravais)'

  parameterize( ks::Array ) = [ (1.0 - x/ks[3])*ks[1] + (x/ks[3])*ks[2] for x=0:ks[3] ]

## dependend of k_path (input)

  k_crystal = mapreduce(parameterize, vcat, k_paths) 

  n_kpt = length(k_crystal)

  k_cartesian = [ reciprocal'*k_crystal[i] for i=1:n_kpt ]

  k_distances = vcat( 0.0, [ norm(k_cartesian[i] - k_cartesian[i-1]) for i=2:n_kpt ] )

  k_cumsum = cumsum(k_distances)

  t_kpoints = toq()

