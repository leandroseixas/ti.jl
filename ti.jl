#!/usr/bin/env julia

##
# Hamiltonian model
#
#    Author: Leandro Seixas <seixasle@gmail.com>
#            Graphene Research Centre (GRC)
#            National University of Singapore (NUS)
#            Singapore
#

  println(STDOUT, "\n\tEffective Hamiltonian model\n")

  using DataFrames
#  using Gadfly

  include("input.jl")
  include("lib/kpoints.jl")
  include("lib/diagonalize.jl")
  include("lib/spin_texture.jl")
#  include("lib/io_dat.jl")

  println(STDOUT, "\n\t..:: Total time ::..")
  println(STDOUT, "\tsetting input:\t\t\t\t", t_input, " s")
  println(STDOUT, "\tsetting k-points:\t\t\t", t_kpoints, " s")
  println(STDOUT, "\tdiagonalizing hamiltonian:\t\t", t_diagonalize, " s")

