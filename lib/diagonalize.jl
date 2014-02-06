##
# Diagonalizing Hamiltonian for each k-point
#

  println(STDOUT, "\tDiagonalizing Hamiltonian.")
  tic()

  eigenvalues = map(eigvals, map(H, k_cartesian))

  band( n::Integer ) = [ eigenvalues[i][n] for i=1:n_kpt ]
 
  t_diagonalize = toq()
