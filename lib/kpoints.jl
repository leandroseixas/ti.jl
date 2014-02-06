##
# k-points path
#

  println(STDOUT, "\tSetting path in Brillouin zone.")

  tic()

  path_parameter( ki::Vector, kf::Vector, n_k::Integer ) = [ (x/n_k)*kf + (1.0 - x/n_k)*ki for x=0:n_k ]

  list_per_path( i::Integer ) = path_parameter(k_path[i]...)

  n_paths = length(collect(k_path))

  k_crystal = mapreduce(list_per_path, vcat, 1:n_paths)

  n_kpt = length(k_crystal)

  reciprocal = 2pi*inv(bravais)

  k_cartesian = [ reciprocal*k_crystal[i] for i=1:n_kpt ]

  t_kpoints = toq()
