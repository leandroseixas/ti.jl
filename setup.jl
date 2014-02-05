#!/usr/bin/env julia

##
# TI/Metal interface Hamiltonian model 
#
#    Author: Leandro Seixas <lseixas@if.usp.br>
#            Instituto de Fisica, Universidade de Sao Paulo (USP)
#            Sao Paulo, SP, Brazil
#

  tic()

# Experimental parameters
  const a = 8.135781
  v_F = 3.20698777
  m_eff = -0.06137
  A =  0.05
  B = 0.05
 
# v_F = 3.20698777 -> 0.00166688*c
# m_eff = 0.01466 -> 0.111*m_0
# m_eff = -0.06137 -> 0.456*m_0

  k_path = (
             ( [ 2/3, 1/3, 0.0 ], [ 0.0, 0.0, 0.0 ], 1000 ),
             ( [ 0.0, 0.0, 0.0 ], [ 0.0, 0.5, 0.0 ], 1000 )
           )

# 2.00, -0.06137, 0.05, 0.05
# 2.00, 0.01466, -0.10, 0.05

  bravais = [   a          0.0   0.0 ;
              a/2  sqrt(3)*a/2   0.0 ;
              0.0          0.0   1.0 ]

# Hamiltonian

  f(k::Array) = -k[2] -im*k[1]

  g(k::Array) = norm(k)^2

  H(k::Array) = [             0    v_F*f(k)                     B                    0 ;
                 v_F*conj(f(k))           0                     0                    B ;
                        conj(B)           0    A + g(k)/(2*m_eff)                    0 ;
                              0     conj(B)                     0  A  + g(k)/(2*m_eff) ]

  t_input = toq()

include("lib/reciprocal_lattice.jl")
include("lib/kpoints.jl")
include("lib/diagonalize.jl")
include("lib/io.jl")

  println(STDOUT, "\n\n\t..:: Total time ::..")
  println(STDOUT, "\t\tsetting input:\t\t\t\t", t_input, " s")
  println(STDOUT, "\t\tsetting k-points:\t\t\t", t_kpoints, " s")
  println(STDOUT, "\t\tdiagonalizing hamiltonian:\t\t", t_diagonalize, " s")
  println(STDOUT, "\t\tsaving band structure in file:\t\t", t_io, " s")

