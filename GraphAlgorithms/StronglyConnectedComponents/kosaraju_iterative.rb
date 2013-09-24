#this is a modified version of my (more elegant) recursive version 
#of kosaraju's depth first search algorithm. i had to do this to 
#avoid stack overflow issues with ruby.

#finds the SCCs of a directed graph
def k(file_name = "SCC.txt")
  graph = Hash.new #key source node, value all endpts
  reverse_graph = Hash.new #key end pt, value all source nodes
  @leaders = Hash.new #key leader name, value nodes in leaders scc
  order = Array.new #holds nodes in order specified by first dfs loop
  @finish_times = Hash.new #key node name, value finishing time

  #read in raw graph
  File.open(file_name, "r") do |file_handle|
    file_handle.each_line do |node|
      a,b = node.split
      a = a.to_i
      b = b.to_i

      #load graph
      if graph.has_key?(a)
        graph[a].push(b)
      else
        graph[a] = [b]
      end

      graph[b] = [] unless graph.has_key?(b)

      #load reverse graph
      if reverse_graph.has_key?(b)
        reverse_graph[b].push(a)
      else
        reverse_graph[b] = [a]
      end

      graph[a] = [] unless graph.has_key?(a)
    end
    puts "finished loading files"
  end 

  #initial dfs to determine order for second dfs
  puts "reverse"
  reverse_graph.keys.sort.reverse.each do |node|
    if @finish_times[node].nil?
      @source = node
      order << depth_first_search(reverse_graph).reverse
    end
  end

  #specify order for second sort
  puts "specify order"

  #the order of the nodes are in chunks. order is an array or arrays at this point. i reverse the chunks here to put them in the correct order
  order.reverse!

  #then condense the array into a single array of nodes
  order.flatten!

  #run dfs a second time
  puts "forward"
  @leaders = Hash.new
  @finish_times = Hash.new

  order.each do |node|
    if @finish_times[node].nil?
      @source = node
      depth_first_search(graph)
    end
  end

  #return answer in the form of the number of nodes in the top
  # five largest SCCs
  answer = Array.new
  @leaders.each_value do |scc|
    scc.uniq!
    answer << scc.length
  end

  return answer.sort.reverse.first(5)
end

def depth_first_search(graph)
  stack = [@source]
  order = []
  @finish_times[@source] = 0

  until stack.empty? do
    node = stack.last
    
    if @leaders[@source].nil?
      @leaders[@source] = [node]
    else
      @leaders[@source].push(node)
    end

    if graph[node]
      unvisited = graph[node].detect { |neighbor| unvisited?(neighbor) }
      if unvisited   
        stack.push(unvisited)
      else
        order.push(stack.pop)
      end
    else 
      order.push(stack.pop)
    end

    @finish_times[node] = 0
  end

  order
end

def unvisited?(node)
  if @finish_times[node] then false else true end
end

def time
  start = Time.now
  answer = k()
  puts "Completed in #{Time.now - start} seconds."
  return answer
end