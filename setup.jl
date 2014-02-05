#!/usr/bin/env julia

##
# TI/Metal interface Hamiltonian model 
#
#    Author: Leandro Seixas <lseixas@if.usp.br>
#            Instituto de Fisica, Universidade de Sao Paulo (USP)
#            Sao Paulo, SP, Brazil
#

# Experimental parameters
  const a = 8.135781
  v_F = 3.20698777
  m_eff = -0.06137
  A =  0.05
  B = 0.05
 
  J = 0.00

# v_F = 3.20698777 -> 0.00166688*c
# m_eff = 0.01466 -> 0.111*m_0
# m_eff = -0.06137 -> 0.456*m_0

  k_path = (
             ( [ 2/3, 1/3, 0.0 ], [ 0.0, 0.0, 0.0 ], 1000 ),
             ( [ 0.0, 0.0, 0.0 ], [ 0.0, 0.5, 0.0 ], 1000 )
           )

# 2.00, -0.06137, 0.05, 0.05
# 2.00, 0.01466, -0.10, 0.05

  a1 = [   a,         0.0,  0.0 ]
  a2 = [ a/2, sqrt(3)*a/2,  0.0 ]
  a3 = [ 0.0,         0.0, 10.0 ]

include("lib/reciprocal_lattice.jl")
include("lib/hamiltonian.jl")
include("lib/kpoints.jl")
include("lib/diagonalize.jl")
include("lib/io.jl")


  println(STDOUT, "\n\n\tTotal time:")
  println(STDOUT, "\t\tsetting hamiltonian:\t\t\t", t_hamiltonian, " s")
  println(STDOUT, "\t\tsetting k-points:\t\t\t", t_kpoints, " s")
  println(STDOUT, "\t\tdiagonalizing hamiltonian:\t\t", t_diagonalize, " s")
  println(STDOUT, "\t\tsaving band structure in file:\t\t", t_io, " s")

