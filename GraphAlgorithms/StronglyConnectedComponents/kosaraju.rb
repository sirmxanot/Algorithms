#finds the SCCs of a directed graph
def kosaraju(file_name = "SCC.txt")
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
  @t = 0 #number of nodes processed so far

  reverse_graph.keys.sort.reverse.each do |node|
    puts "node #{node}"
    if @finish_times[node].nil?
      @source = node
      depth_first_search(reverse_graph, node)
    end
  end

  #specify order for second sort
  puts "specify order"
  #order = @finish_times
  #puts "order #{order}"
  order = @finish_times.invert
  order = Hash[order.sort.reverse]

  #run dfs a second time
  puts "forward"
  @leaders = Hash.new
  @finish_times = Hash.new
  @t = 0

  puts "order #{order}"

  order.each_value do |node|
    if @finish_times[node].nil?
      @source = node
      depth_first_search(graph, node)
    end
  end

  #return answer in the form of the number of nodes in the top
  # five largest SCCs
  answer = Array.new

  @leaders.each_value do |scc|
    answer << scc.length
  end

  return answer.sort.reverse
end

def depth_first_search(graph, node)
  s = @source

  if @leaders[s].nil?
    @leaders[s] = [node]
  else
    @leaders[s].push(node)
  end

  @finish_times[node] = 0

  if graph[node] != nil
    graph[node].each do |arc|
      if @finish_times[arc].nil?
        depth_first_search(graph, arc)
      end
    end
  end
  @t += 1
  @finish_times[node] = @t
end

def time
  start = Time.now
  answer = kosaraju()
  puts "Completed in #{Time.now - start} seconds."
  return answer
end