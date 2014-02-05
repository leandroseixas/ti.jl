  volume = dot(a1, cross(a2, a3))

  @assert volume > 0

  b1 = 2*pi*cross(a2, a3)/volume
  b2 = 2*pi*cross(a3, a1)/volume
  b3 = 2*pi*cross(a1, a2)/volume
