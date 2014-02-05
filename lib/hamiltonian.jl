##
# effective Hamiltonian
#

  println(STDOUT, "\033[1;32m\tSetting\033[0m Hamiltonian.")

  tic()

  f(k::Array) = -k[2] -im*k[1]

  g(k::Array) = norm(k)^2

  H(k::Array) = [             0  v_F*f(k)                   B                   0 ;
                 v_F*conj(f(k))         0                   0                   B ;
                        conj(B)         0  A + J/2 + g(k)/(2*m_eff)                   0 ;
                              0   conj(B)                   0  A - J/2 + g(k)/(2*m_eff) ]

  t_hamiltonian = toq()
