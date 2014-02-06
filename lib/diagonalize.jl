##
# Diagonalizing Hamiltonian for each k-point
#

  println(STDOUT, "\033[1;32m\tDiagonalizing\033[0m Hamiltonian.")
  tic()

  eigenvalues = map(eigvals, map(H, k_cartesian))

  band( n::Integer ) = [ eigenvalues[i][n] for i=1:n_kpt ]
 
  t_diagonalize = toq()
