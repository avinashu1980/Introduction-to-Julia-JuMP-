using JuMP
m = Model()
@defVar(m, x >=0)
@defVar(m, y >=0)
@setObjective(m, Min, 10x + 26y)
@addConstraint(m, const1,  11x + 3y >=  21)
@addConstraint(m, const2,   6x + 20y >= 39)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getObjectiveValue(m))
println("Optimal Solutions:")
println("x = ", getValue(x))
println("y = ", getValue(y))

