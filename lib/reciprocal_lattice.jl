##
# Reciprocal lattice basis
#

  volume = det(bravais) 

  @assert volume > 0

  reciprocal = 2pi*inv(bravais)

#  b1 = 2*pi*cross(a2, a3)/volume
#  b2 = 2*pi*cross(a3, a1)/volume
#  b3 = 2*pi*cross(a1, a2)/volume
