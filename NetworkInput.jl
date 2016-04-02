# initializing the variables
num_of_nodes = 0
num_of_arcs = 0
origin = 0
destination = 0

# Opening the input file AhujaNet.txt
f = open("AhujaNet.txt","r")
line = readline(f)
num_of_nodes = parse(Int, line[search(line,':')+1:end-1])
line = readline(f)
num_of_arcs = parse(Int, line[search(line,':')+1:end-1])
line = readline(f)
origin = parse(Int, line[search(line,':')+1:end-1])
line = readline(f)
destination = parse(Int, line[search(line,':')+1:end-1])
line = readline(f)
start_node = Array(Int,num_of_arcs)
end_node = Array(Int,num_of_arcs)
cost = zeros(num_of_arcs)
arcs = [1:num_of_arcs]
for idx in arcs
	line = readline(f)
	line = strip(line, '\n')
	data = split(line)
	start_node[idx] = parse(Int,data[1])
	end_node[idx] = parse(Int,data[2])
	cost[idx] = parse(Float64,data[3])
end
close(f)


# Printing Network Information in Output.txt
of = open("Output.txt", "w")
println(num_of_nodes)
write(of, "Number of Nodes: $num_of_nodes","\n" )
write(of, "Number of Arcs: $num_of_arcs", "\n")
write(of, "Origin Node: $origin", "\n")
write(of, "Destination: $destination", "\n")
write(of, "StartNode, EndNode, Cost", "\n")
for idx in arcs
    s=start_node[idx]
	e=end_node[idx]
	c=cost[idx]
	write(of,"$s, $e, $c", "\n")
end
close(of) 




