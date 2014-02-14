##
#  Spin texture
#

const Sigma_x = [ 0. 1. 0. 0. ;
  	          1. 0. 0. 0. ;
	          0. 0. 0. 1. ;
	          0. 0. 1. 0. ]

const Sigma_y = [ 0. -1im 0. 0. ;
	          1im  0. 0. 0. ;
	          0. 0. 0. -1im ;
	          0. 0. +1im 0. ]

const Sigma_z = [ 1.  0.  0.  0. ;
	          0. -1.  0.  0. ;
	          0.  0.  1.  0. ;
	          0.  0.  0. -1. ]

  Sx( n::Integer ) = [ real(psi(k,n)'*Sigma_x*psi(k,n))[1] for k=1:n_kpt ]
  Sy( n::Integer ) = [ real(psi(k,n)'*Sigma_y*psi(k,n))[1] for k=1:n_kpt ]
  Sz( n::Integer ) = [ real(psi(k,n)'*Sigma_z*psi(k,n))[1] for k=1:n_kpt ]

  k_Sx( n::Integer ) = hcat( k_cumsum, Sx(n) )
  k_Sy( n::Integer ) = hcat( k_cumsum, Sy(n) )
  k_Sz( n::Integer ) = hcat( k_cumsum, Sz(n) )

