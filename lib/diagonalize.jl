##
# Diagonalizing Hamiltonian for each k-point
#
#  Import: H, k_cartesian, k_cumsum
#  Export: band, psi

  println(STDOUT, "\tDiagonalizing Hamiltonian.")
  tic()

  n_bands = rank(H(first(k_cartesian)))
  eigensystem = map(eig, map(H, k_cartesian))

#  eigenvalues = map(eigvals, map(H, k_cartesian))
#  eigenvectors = map(eigvecs, map(H, k_cartesian))

#  band( n::Integer ) = [ real(eigenvalues[i][n]) for i=1:n_kpt ]    # old
  band( n::Integer ) = [ real(eigensystem[i][1][n]) for i=1:n_kpt ]

  band_dataframe = DataFrame()
  band_dataframe[:k] = k_cumsum

  for i=1:n_bands
    band_dataframe[symbol(string("e", i))] = band(i)
  end

  writetable("bands.csv", band_dataframe)

#  psi( k::Integer, n::Integer ) = eigenvectors[k][:,n]    # old
  psi( k::Integer, n::Integer ) = eigensystem[k][2][:,n]

  t_diagonalize = toq()
