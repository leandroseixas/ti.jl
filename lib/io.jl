##
# IO
#

  println(STDOUT,"\tSaving bands in file.")

  tic()

  k_distances = vcat( 0.0, [ norm(k_cartesian[i] - k_cartesian[i-1]) for i=2:n_kpt ] )
  k_cumsum = cumsum(k_distances)

  k_band( n::Integer ) = hcat( k_cumsum, band(n) )

  k_Sx( n::Integer ) = hcat( k_cumsum, Sx(n) )
  k_Sy( n::Integer ) = hcat( k_cumsum, Sy(n) )
  k_Sz( n::Integer ) = hcat( k_cumsum, Sz(n) )

  n_bands = rank(H(first(k_cartesian)))

  file_band = open("./bands.dat", "w")
    for i=1:n_bands
      println(file_band, k_band(i))
    end
  close(file_band)

  file_sx = open("./Sx.dat", "w")
    for i=1:n_bands
      println(file_sx, k_Sx(i))
    end
  close(file_sx)

  file_sy = open("./Sy.dat", "w")
    for i=1:n_bands
      println(file_sy, k_Sy(i))
    end
  close(file_sy)

  file_sz = open("./Sz.dat","w")
    for i=1:n_bands
      println(file_sz, k_Sz(i))
    end
  close(file_sz)

  t_io = toq()
