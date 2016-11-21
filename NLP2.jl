# Miguel ODOT Problem 
# ODOT wants to find the best way to inform customers about traffic conditions. 
# The marketing department says that if $x1 is spent using social media, the audience will be 6(x1)1/2. 
# But if $x2 is spent using traditional media, the audience will be 4(x2)1/2. 
# The advertising budget is $100 thousand dollars. Assume x1 and x2 are in thousand dollars. What should ODOT do? 

using JuMP, Ipopt
m = Model(solver=IpoptSolver())

m = Model()
@variable(m, x >=0)
@variable(m, y >=0)
@NLobjective(m, Max, 6sqrt(x) + 4sqrt(y))
@constraint(m, const1,  x + y <=  100)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getobjectivevalue(m))
println("Optimal Solutions:")
println("x = ", getvalue(x))
println("y = ", getvalue(y))

