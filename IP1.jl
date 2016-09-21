using JuMP
m = Model()
@variable(m, x >=0, Int)
@variable(m, y >=0, Int)
@objective(m, Min, 10x + 26y)
@constraint(m, const1,  11x + 3y >=  21)
@constraint(m, const2,   6x + 20y >= 39)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getobjectivevalue(m))
println("Optimal Solutions:")
println("x = ", getvalue(x))
println("y = ", getValue(y))

