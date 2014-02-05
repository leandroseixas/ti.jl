##
# IO
#

  println(STDOUT,"\033[1;31m\tSaving\033[0m bands in file.")

  tic()

  k_distances = vcat( 0.0, [ norm(k_cartesian[i] - k_cartesian[i-1]) for i=2:n_kpt ] )
  k_cumsum = cumsum(k_distances)

  k_band(n::Integer) = hcat( k_cumsum, band(n) )

  n_bands = rank(H(first(k_cartesian)))

  file_band = open("./bands.dat", "w")
    for i=1:n_bands
      println(file_band, k_band(i))
    end
  close(file_band)

  t_io = toq()
