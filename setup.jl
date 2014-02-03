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

# 2.00, -0.06137, 0.05, 0.05
# 2.00, 0.01466, -0.10, 0.05

  a1 = [   a,         0.0,  0.0 ]
  a2 = [ a/2, sqrt(3)*a/2,  0.0 ]
  a3 = [ 0.0,         0.0, 10.0 ]

  volume = dot(a1, cross(a2, a3))

@assert volume > 0

  b1 = 2*pi*cross(a2, a3)/volume
  b2 = 2*pi*cross(a3, a1)/volume
  b3 = 2*pi*cross(a1, a2)/volume

include("src/hamiltonian.jl")
include("src/kpoints.jl")
include("src/diagonalize.jl")
include("src/io.jl")


