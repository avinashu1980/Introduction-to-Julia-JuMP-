# 1040444.375
# J.E.Beasley "An algorithm for solving  
# large capacitated warehouse location problems" European 
# Journal of Operational Research 33 (1988) 314-325.

using JuMP
using Gurobi
m = Model(solver=GurobiSolver())


# initializing the variables
num_loc = 0
num_cust = 0

# Opening the input file cap41.txt
f = open("cap41.txt","r")
line = readline(f)
line = strip(line, '\n')
data = split(line)
num_loc = parse(Int,data[1])
num_cust = parse(Int,data[2])
cap = zeros(Int, num_loc)
fc = zeros(num_loc)
dem = zeros(Int, num_cust)
vc = zeros(num_cust, num_loc)
for idx=1:num_loc
	line = readline(f)
	line = strip(line, '\n')
	data = split(line)
	cap[idx] = parse(Int,data[1])
	fc[idx] = parse(Float64,data[2])
end
for idx=1:num_cust
    line = readline(f)
	line = strip(line, '\n')
	dem[idx] = parse(Int,line)
	line = readline(f)
	line = strip(line, '\n')
	data = split(line)
	for jdx=1:length(data)
        vc[idx,jdx] = parse(Float64,data[jdx])
	end
end
close(f)
	

@defVar(m, 0<= x[1:num_cust,1:num_loc] <= 1)
@defVar(m, y[1:num_loc], Bin)
@setObjective(m, Min, sum{vc[i,j]*x[i,j], i in 1:num_cust, j in 1:num_loc} + sum{fc[j]*y[j], j in 1:num_loc}  )
for j=1:num_loc
	@addConstraint(m, sum{dem[i]*x[i,j], i in 1:num_cust} <= cap[j]*y[j])
end
for i=1:num_cust
	@addConstraint(m, sum{x[i,j], j in 1:num_loc} == 1)
end
for i=1:num_cust
	for j=1:num_loc
		@addConstraint(m,x[i,j] <= y[j])
	end
end
print(m)
solve(m)
obj = getObjectiveValue(m)
sp =  getValue(x)
loc = round(Int,getValue(y))
	
#println(sp)	
	
# Printing Input Information in OutputCap.txt
of = open("OutputCap.txt", "w")
write(of, "The Objective Function :  $obj","\n")
write(of, "Open Facilities:", "\n")
writedlm(of, loc)
write(of, "The Customer Facility Assignment: ", "\n")
writedlm(of, sp)
write(of, "\n\n")
write(of, "***************************************************","\n")
write(of, "Input Information","\n")
write(of, "***************************************************","\n")
write(of, "Number of Potential Locations: $num_loc","\n" )
write(of, "Number of Customers: $num_cust", "\n")
write(of, "Capacity, Fixed Cost", "\n")
for idx=1:num_loc
    s=cap[idx]
	e=fc[idx]
	write(of,"$s, $e", "\n")
end
write(of,"Demand for each customer", "\n")
writedlm(of,dem)
write(of,"Cost of transporting demand to each location", "\n")
writedlm(of,vc,",")
close(of) 
