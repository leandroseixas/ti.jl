##
#  Spin texture
#

const Σ_x = [ 0. 1. 0. 0. ;
  	          1. 0. 0. 0. ;
	          0. 0. 0. 1. ;
	          0. 0. 1. 0. ]

const Σ_y = [ 0. -1im 0. 0. ;
	          1im  0. 0. 0. ;
	          0. 0. 0. -1im ;
	          0. 0. +1im 0. ]

const Σ_z = [ 1.  0.  0.  0. ;
	          0. -1.  0.  0. ;
	          0.  0.  1.  0. ;
	          0.  0.  0. -1. ]

  Sx( n::Integer ) = [ real(psi(k,n)'*Σ_x*psi(k,n))[1] for k=1:n_kpt ]
  Sy( n::Integer ) = [ real(psi(k,n)'*Σ_y*psi(k,n))[1] for k=1:n_kpt ]
  Sz( n::Integer ) = [ real(psi(k,n)'*Σ_z*psi(k,n))[1] for k=1:n_kpt ]

  sx_dataframe = DataFrame()
  sy_dataframe = DataFrame()
  sz_dataframe = DataFrame()

  sx_dataframe[:k] = k_cumsum
  sy_dataframe[:k] = k_cumsum
  sz_dataframe[:k] = k_cumsum

  for i=1:n_bands
    sx_dataframe[symbol(string("b", i))] = Sx(i)
    sy_dataframe[symbol(string("b", i))] = Sy(i)
    sz_dataframe[symbol(string("b", i))] = Sz(i)
  end

  writetable("Sx.csv", sx_dataframe)
  writetable("Sy.csv", sy_dataframe)
  writetable("Sz.csv", sz_dataframe)

#  k_Sx( n::Integer ) = hcat( k_cumsum, Sx(n) )
#  k_Sy( n::Integer ) = hcat( k_cumsum, Sy(n) )
#  k_Sz( n::Integer ) = hcat( k_cumsum, Sz(n) )

