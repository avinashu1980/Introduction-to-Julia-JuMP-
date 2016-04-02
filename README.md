# Introduction to Julia and JuMP

This folder contains introductory programs for undergraduate students and beginning masters students with interest in transportation and freight network analysis to get comfortable with Julia and JuMP.

Dont forget to add the Graphs package in Julia before running several of the above programs.

[NetworkInput.jl] should provide you with a sample file to read input from file and write output to file. Make sure [NetworkInput.jl] and [AhujaNet.txt] are in the same directory.

[Djikstra.jl] is a sample file demonstrating the use of in built Djikstra’s algorithm function in determining shortest path. The output can be found in **Output.txt**

[ShortPath.jl] is a sample file demonstrating solution of shortest path using a Linear Programming formulation.

[CapFl.jl] is a capacitated facility location model. The input [cap41.txt] file corresponds to the standard cap41 dataset available at: http://people.brunel.ac.uk/~mastjjb/jeb/orlib/capinfo.html
  
[HubLoc.jl] is a Single Allocation Hub Network Design formulation based on the modification of SALP formulation originally provided by
  
Ernst, A.T., Krishnamoorthy, M., 1999. Solution algorithms for the capacitated single allocation hub 
location problem. Annals of Operations Research 86 (0), 141–159.

The modified formulation is presented in

Alumur, S.A., Nicketl, S., Saldanha-da-Gama, F., 2012. Hub Location under Uncertainty. Transportation   
Research Part B, 46(12), 529-543.

The CAB data set PHUB4 is used in this model

[//]:

[NetworkInput.jl]: <https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/NetworkInput.jl>
[AhujaNet.txt]: <https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/AhujaNet.txt>
[Djikstra.jl]: <https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/Djikstra.jl>
[ShortPath.jl]: <https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/ShortPath.jl>
[CapFl.jl]: https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/CapFL.jl
[cap41.txt]: https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/cap41.txt
[HubLoc.jl]: https://github.com/avinashu1980/Introduction-to-Julia-JuMP-/blob/master/HubLoc.jl


