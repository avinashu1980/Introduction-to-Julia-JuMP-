# Single Allocation Hub Netowrk Design Based On
# Modification of SALP formulation originally provided by
# Ernst, A.T., Krishnamoorthy, M., 1999. Solution algorithms for the capacitated single allocation hub 
# location problem. Annals of Operations Research 86 (0), 141–159.
# Modification presented in
# Alumur, S.A., Nicketl, S., Saldanha-da-Gama, F., 2012. Hub Location under Uncertainty. Transportation   
# Research Part B, 46(12), 529-543.
# The CAB data set PHUB4 is used in this model

using JuMP
using Gurobi
m = Model(solver=GurobiSolver())


# initializing the variables
num_loc = 0

# Opening the input file CAB25.txt
f = open("CAB25.txt","r")
line = readline(f)
line = strip(line, '\n')
num_loc = parse(Int,line)
d = zeros(num_loc, num_loc)
w = zeros(num_loc, num_loc)
line = readline(f)
for idx=1:num_loc
	for jdx=1:num_loc
		line = readline(f)
		line = strip(line, '\n')
		data = split(line)
		d[idx,jdx] = parse(Float64,data[3])
	end
end
line = readline(f)
for idx=1:num_loc
	for jdx=1:num_loc
		line = readline(f)
		line = strip(line, '\n')
		data = split(line)
		w[idx,jdx] = parse(Float64,data[3])
	end
end
close(f)

summation = sum(w)
w = w/summation
O = sum(w,1)
De = sum(w,2)
f = log(O)
alpha = 0.2

@defVar(m, x[1:num_loc,1:num_loc], Bin)
@defVar(m, y[1:num_loc, 1:num_loc, 1:num_loc] >= 0)
@setObjective(m, Min, sum{f[k]*x[k,k], k in 1:num_loc} + sum{d[i,k]*O[i]*x[i,k], i in 1:num_loc,k in 1:num_loc} + sum{d[k,l]*y[i,k,l]*alpha, i in 1:num_loc,l in 1:num_loc,k in 1:num_loc } + sum{De[i]*d[k,i]*x[i,k], k in 1:num_loc,i in 1:num_loc}  )

for i=1:num_loc
	@addConstraint(m, sum{x[i,k], k in 1:num_loc} == 1)
end

for i=1:num_loc
	for k=1:num_loc
		@addConstraint(m, x[i,k] <= x[k,k])
	end
end

# If the formulation is to be changed to phub location problem, add the following constraint.
#@addConstraint(m, sum{x[k,k], k in 1:num_loc} == P)

for i=1:num_loc
	for k=1:num_loc
		@addConstraint(m, sum{y[i,k,l], l in 1:num_loc} - sum{y[i,l,k], l in 1:num_loc}  == O[i]*x[i,k] - sum{w[i,j]*x[j,k], j in 1:num_loc})
	end
end

for i=1:num_loc
	for k=1:num_loc
		@addConstraint(m, sum{y[i,k,l], l in 1:num_loc; l!=k} <= O[i]*x[i,k] )
	end
end

#print(m)
solve(m)
obj = getObjectiveValue(m)
sp =  round(Int,getValue(x))
loc = getValue(y)
	
# Printing Input Information in OutputCap.txt
of = open("OutputHub.txt", "w")
write(of, "The Objective Function :  $obj","\n")
write(of, "Allocation:", "\n")
writedlm(of,x, ",")
write(of, "Flow: ", "\n")
writedlm(of, y, ",")
write(of, "\n\n")
write(of, "***************************************************","\n")
write(of, "Input Information","\n")
write(of, "***************************************************","\n")
write(of, "Number of Potential Locations: $num_loc","\n" )
write(of,"Distance", "\n")
writedlm(of,d,",")
write(of," Demand","\n")
writedlm(of,w,",")
close(of) 
