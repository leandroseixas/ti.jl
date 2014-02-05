##
# Diagonalizing Hamiltonian for each k-point
#

  println(STDOUT, "\033[1;32m\tDiagonalizing\033[0m Hamiltonian.")
  tic()

  energies = map(eigvals, map(H, k_cartesian))

  band(n::Integer) = [ energies[i][n] for i=1:n_kpt ]
  
  t_diagonalize = toq()
