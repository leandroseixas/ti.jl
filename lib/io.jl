##
# IO
#

  println(STDOUT,"\033[1;31m\tSaving\033[0m bands in file.")

  k_distances = vcat( 0.0, [ norm(k_cartesian[i] - k_cartesian[i-1]) for i=2:n_kpt ] )
  k_path = cumsum(k_distances)

  k_band(n) = hcat( k_path, band(n) )

  n_bands = rank(H(first(k_cartesian)))

  f_band = open("./bands.dat", "w")
    for i=1:n_bands
      println(f_band, k_band(i))
    end
  close(f_band)
