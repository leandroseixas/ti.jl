#!/usr/bin/env julia

##
# TI/M Hamiltonian model
#
#    Author: Leandro Seixas <lseixas@if.usp.br>
#            Instituto de Fisica, Universidade de Sao Paulo (USP)
#            Sao Paulo, SP, Brazil
#

  println(STDOUT, "\n\tTI/M Hamiltonian model\n")

  using DataFrames
#  using Gadfly

  include("input.jl")
  include("lib/kpoints.jl")
  include("lib/diagonalize.jl")
#  include("lib/spin_texture.jl")
#  include("lib/io.jl")

  println(STDOUT, "\n\t..:: Total time ::..")
  println(STDOUT, "\tsetting input:\t\t\t\t", t_input, " s")
  println(STDOUT, "\tsetting k-points:\t\t\t", t_kpoints, " s")
  println(STDOUT, "\tdiagonalizing hamiltonian:\t\t", t_diagonalize, " s")
#  println(STDOUT, "\tsaving band structure in file:\t\t", t_io, " s")

