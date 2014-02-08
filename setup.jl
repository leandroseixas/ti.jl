#!/usr/bin/env julia

##
# TI/M Hamiltonian model 
#
#    Author: Leandro Seixas <lseixas@if.usp.br>
#            Instituto de Fisica, Universidade de Sao Paulo (USP)
#            Sao Paulo, SP, Brazil
#

  println(STDOUT, "\n\tTI/M Hamiltonian model\n")

  tic()

##
# Crystallographic data
#

  const a = 8.135781

  bravais = [   a          0.0   0.0 ;
              a/2  sqrt(3)*a/2   0.0 ;
	      0.0          0.0  10.0 ]

  k_path = (
	      ( [ 2/3, 1/3, 0.0 ], [ 0.0, 0.0, 0.0 ], 1000 ),
	      ( [ 0.0, 0.0, 0.0 ], [ 0.0, 0.5, 0.0 ], 1000 )
           )

##
# Hamiltonian
#

  const v_F = 3.20698777
#  const m_eff = -0.06137
  const m_eff = 0.01466
#  const Delta = 0.05
  const Delta = -0.10
  const alpha = 0.05
#  const alpha = 0.00

# v_F = 3.20698777 -> 0.00166688*c
# m_eff = 0.01466 -> 0.111*m_0
# m_eff = -0.06137 -> 0.456*m_0
# Example 1: 3.2069877, -0.06137,  0.05, 0.05
# Example 2: 3.2069877,  0.01466, -0.10, 0.05

  f(k::Vector) = -k[2] - im*k[1]

  g(k::Vector) = (1/2)*norm(k)^2

  H(k::Vector) = [            0     v_F*f(k)                 alpha                   0 ;
                 v_F*conj(f(k))            0                     0               alpha ;
                    conj(alpha)            0    Delta + g(k)/m_eff                   0 ;
                              0  conj(alpha)                     0  Delta + g(k)/m_eff ]

  t_input = toq()

include("lib/kpoints.jl")
include("lib/diagonalize.jl")
include("lib/io.jl")

  println(STDOUT, "\n\t..:: Total time ::..")
  println(STDOUT, "\tsetting input:\t\t\t\t", t_input, " s")
  println(STDOUT, "\tsetting k-points:\t\t\t", t_kpoints, " s")
  println(STDOUT, "\tdiagonalizing hamiltonian:\t\t", t_diagonalize, " s")
  println(STDOUT, "\tsaving band structure in file:\t\t", t_io, " s")

