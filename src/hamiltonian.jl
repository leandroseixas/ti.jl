##
# effective Hamiltonian
#

  println(STDOUT, "\033[1;32m\tSetting\033[0m Hamiltonian.")

  f(k) = -k[2] -im*k[1]
  g(k) = norm(k)^2

  H(k) = [             0  v_F*f(k)         C         0 ;
          v_F*conj(f(k))         0         0         C ;
                 conj(C)         0  A*g(k)+B         0 ;
                       0   conj(C)         0  A*g(k)+B ]
