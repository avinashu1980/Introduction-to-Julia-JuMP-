# Provide a strong/friendly and weak formulation for the mining problem.  
# 1,2
# 2,-4
# 3,-10
# 4,-6
# 5,3
# 6,9
# 7,-10
# 8,9
# 9,-5
# 10,15
# Expanded Version Strong Formulation
# Charles Revelle Facility Siting and Integer-Friendly Programming 
# European Journal of Operational Research 65 (I 993) 147-158


using JuMP
m = Model()

p = [2; -4; -10; -6; 3; 9; -10; 9 ; -5; 15]

# @variable(m, x[1:10], Bin)
@variable(m, 0 <= x[1:10] <= 1)

@objective(m, Max, sum{p[i]*x[i], i in 1:10})

@constraint(m, const1,  x[5] - x[1] <=  0)
@constraint(m, const2,  x[5] - x[2] <=  0)
@constraint(m, const3,  x[6] - x[2] <=  0)
@constraint(m, const4,  x[6] - x[3] <=  0)
@constraint(m, const5,  x[7] - x[3] <=  0)
@constraint(m, const6,  x[7] - x[4] <=  0)
@constraint(m, const7,  x[8] - x[5] <=  0)
@constraint(m, const8,  x[8] - x[6] <=  0)
@constraint(m, const9,  x[9] - x[6] <=  0)
@constraint(m, const10,  x[9] - x[7] <=  0)
@constraint(m, const11,  x[10] - x[8] <=  0)
@constraint(m, const12,  x[10] - x[9] <=  0)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getobjectivevalue(m))
println("Optimal Solutions:")

sp = getvalue(x)
println(sp)


