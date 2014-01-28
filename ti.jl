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
  const v_F = 0.20
  const A = -0.05
  const B = 0.05
  const C = 0.05

  a1 = [   a,         0.0,  0.0 ]
  a2 = [ a/2, sqrt(3)*a/2,  0.0 ]
  a3 = [ 0.0,         0.0, 10.0 ]

  volume = dot(a1, cross(a2, a3))

  b1 = 2*pi*cross(a2, a3)/volume
  b2 = 2*pi*cross(a3, a1)/volume
  b3 = 2*pi*cross(a1, a2)/volume

include("src/hamiltonian.jl")
include("src/k-points.jl")
include("src/diagonalize.jl")
include("src/io.jl")
