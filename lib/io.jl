##
# IO
#
# Import: H, k_cartesian, k_band, k_Sx, k_Sy, k_Sz
#

#  println(STDOUT,"\tSaving bands in file.")

#  tic()

#  n_bands = rank(H(first(k_cartesian)))

#  file_band = open("./bands.dat", "w")
#    for i=1:n_bands
#      println(file_band, k_band(i))
#    end
#  close(file_band)

#  file_sx = open("./Sx.dat", "w")
#    for i=1:n_bands
#      println(file_sx, k_Sx(i))
#    end
#  close(file_sx)

#  file_sy = open("./Sy.dat", "w")
#    for i=1:n_bands
#      println(file_sy, k_Sy(i))
#    end
#  close(file_sy)

#  file_sz = open("./Sz.dat","w")
#    for i=1:n_bands
#      println(file_sz, k_Sz(i))
#    end
#  close(file_sz)

#  t_io = toq()
