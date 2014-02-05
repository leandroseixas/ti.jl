##
# k-points path
#

  println(STDOUT, "\033[1;32m\tSetting\033[0m path in Brillouin zone.")

  tic()

  path_parameter( ki::Array, kf::Array, n_k::Integer ) = [ (x/n_k)*kf + (1.0 - x/n_k)*ki for x=0:n_k ]

  list_per_path(i) = path_parameter(k_path[i][1], k_path[i][2], k_path[i][3])

  n_paths = length(collect(k_path))

  k_crystal = mapreduce(list_per_path, vcat, 1:n_paths)

  n_kpt = length(k_crystal)

  reciprocal = 2pi*inv(bravais)

  k_cartesian = [ reciprocal*k_crystal[i] for i=1:n_kpt ]

  t_kpoints = toq()
