##
# Input data
#
#  file: input.jl
#
#  Export: bravais, k_paths, H, f, g

 tic()

##
# Crystallographic data
#

  const a = 8.135781

  bravais = [   a          0.0   0.0 ;
              a/2  sqrt(3)*a/2   0.0 ;
	            0.0          0.0  10.0 ]

  k_paths = {
	            { [ 2/3, 1/3, 0.0 ], [ 0.0, 0.0, 0.0 ], 100 },
	            { [ 0.0, 0.0, 0.0 ], [ 0.0, 0.5, 0.0 ], 100 }
            }

##
# Hamiltonian data
#

  const v_F = 3.20698777
  const m_eff = -0.06137
#  const m_eff = 0.01466
  const Δ = 0.05
#  const D = -0.10
  const α_0 = 0.00
  const α_1 = 0.0
  const α_2 = 0.0
  const α_3 = 0.05im

# v_F = 3.20698777 -> 0.00166688*c
# m_eff = 0.01466 -> 0.111*m_0
# m_eff = -0.06137 -> 0.456*m_0
# Example 1: 3.2069877, -0.06137,  0.05, 0.05
# Example 2: 3.2069877,  0.01466, -0.10, 0.05

  f(k::Vector) = -k[2] - im*k[1]

  g(k::Vector) = (1/2)*norm(k)^2

  H(k::Vector) = [              0      v_F*f(k)       α_0 + α_3    α_1 - im*α_2 ;
                   v_F*conj(f(k))             0    α_1 + im*α_2       α_0 - α_3 ;
                  conj(α_0) + conj(α_3)  conj(α_1) - im*conj(α_2)  Δ + g(k)/m_eff      0 ;
                  conj(α_1) + im*conj(α_2)  conj(α_0) - conj(α_3)     0  Δ + g(k)/m_eff ]

  t_input = toq()
