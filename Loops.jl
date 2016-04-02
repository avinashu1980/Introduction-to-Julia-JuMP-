x = 10
println(x)
if (x > 5)
   println("x is larger than 5")
elseif (x < 5)
   println("x is smaller than 5")
else
   println("x is equal to 5")
end

y=0
while y<=x
   println(y)
   y=y+1
end

cities = ["Nashville", "Austin" , "Pittsburgh"]
for a in cities
  println(a)
end

z=[1:10]
for i in z
  if i%2==0
	println(i)
  end
end

	
