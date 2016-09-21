# Solving Example 10.5.5 in 
# Mokhtar S. Bazaraa, Hanif D. Sherali, C. M. Shetty. Nonlinear Programming: Theory and Algorithms, 2006

using JuMP
m = Model()
@variable(m, x >=0)
@variable(m, y >=0)
@objective(m, Min, 2x^2 + 2y^2 - 2x*y - 4x - 6y)
@constraint(m, const1,  x + y <=  2)
@constraint(m, const2,  x + 5y <= 5)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getobjectivevalue(m))
println("Optimal Solutions:")
println("x = ", getvalue(x))
println("y = ", getvalue(y))

