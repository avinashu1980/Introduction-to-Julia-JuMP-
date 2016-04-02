# Solving Example 10.5.5 in 
# Mokhtar S. Bazaraa, Hanif D. Sherali, C. M. Shetty. Nonlinear Programming: Theory and Algorithms, 2006

using JuMP
m = Model()
@defVar(m, x >=0)
@defVar(m, y >=0)
@setObjective(m, Min, 2x^2 + 2y^2 - 2x*y - 4x - 6y)
@addConstraint(m, const1,  x + y <=  2)
@addConstraint(m, const2,  x + 5y <= 5)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getObjectiveValue(m))
println("Optimal Solutions:")
println("x = ", getValue(x))
println("y = ", getValue(y))

