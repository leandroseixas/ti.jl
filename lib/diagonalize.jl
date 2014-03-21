##
# Diagonalizing Hamiltonian for each k-point
#
#  Import: H, k_cartesian, k_cumsum
#  Export: band, psi

  println(STDOUT, "\tDiagonalizing Hamiltonian.")
  tic()

#  eigensystem( H::Matrix, k::Vector) = ...
#  eigensystem = map(eig, map(H, k_cartesian))

  eigenvalues = map(eigvals, map(H, k_cartesian))

  band( n::Integer ) = [ real(eigenvalues[i][n]) for i=1:n_kpt ]

  k_band( n::Integer ) = hcat( k_cumsum, band(n) )

  eigenvectors = map(eigvecs, map(H, k_cartesian))

  psi( k::Integer, n::Integer ) = eigenvectors[k][1:4,n]

  t_diagonalize = toq()
