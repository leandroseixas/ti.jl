##
# k-points path
#

  println(STDOUT, "\033[1;32m\tSetting\033[0m path in Brillouin zone.")

  path(ki, kf, n_k) = [ (x/n_k)*kf + (1.0 - x/n_k)*ki for x=0:n_k ]

  k_KG = path( [ 2/3, 1/3, 0.0 ], [ 0.0, 0.0, 0.0 ], 100 )
  k_GM = path( [ 0.0, 0.0, 0.0 ], [ 0.0, 0.5, 0.0 ], 100 )
  k_frac = vcat( k_KG, k_GM )

  n_kpt = length(k_frac)

  k_cartesian = [ k_frac[i][1]*b1 + k_frac[i][2]*b2 for i=1:n_kpt ]

#  println(STDOUT, "\033[1;32m\t  ...\033[0m")
