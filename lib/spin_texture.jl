##
#  Spin texture
#

Sigma_x = [ 0. 1. 0. 0. ;
	    1. 0. 0. 0. ;
	    0. 0. 0. 1. ;
	    0. 0. 1. 0. ]

Sigma_y = [ 0. -1im 0. 0. ;
	    1im  0. 0. 0. ;
	    0. 0. 0. -1im ;
	    0. 0. +1im 0. ]

Sigma_z = [ 1.  0.  0.  0. ;
	    0. -1.  0.  0. ;
	    0.  0.  1.  0. ;
	    0.  0.  0. -1. ]

Sx( n::Integer ) = [ real(psi(k,n)'*Sigma_x*psi(k,n))[1] for k=1:n_kpt ]

Sy( n::Integer ) = [ real(psi(k,n)'*Sigma_y*psi(k,n))[1] for k=1:n_kpt ]

Sz( n::Integer ) = [ real(psi(k,n)'*Sigma_z*psi(k,n))[1] for k=1:n_kpt ]

