##
# Diagonalizing Hamiltonian for each k-point
#

  println(STDOUT, "\tDiagonalizing Hamiltonian.")
  tic()

#  eigensystem = map(eig, map(H, k_cartesian))

  eigenvalues = map(eigvals, map(H, k_cartesian))

  band( n::Integer ) = [ eigenvalues[i][n] for i=1:n_kpt ]

  eigenvectors = map(eigvecs, map(H, k_cartesian))

  psi( k::Integer, n::Integer ) = eigenvectors[k][1:4,n]

  t_diagonalize = toq()
