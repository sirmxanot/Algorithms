def johnson(file_name = "g3.csv")
  require 'csv'

  #load source file for graph
  inf = Float::INFINITY
  @nodes = Hash.new
  @lengths = Hash.new
  @graph = Hash.new
  @rgraph = Hash.new
  @solutions = Hash.new
  shortest = inf
  @edge_weights = Hash.new

  CSV.foreach(file_name, :converters => :integer) do |edge| 
    @lengths[[edge[0],edge[1]]] = edge[2]
    if @graph.has_key?(edge[0])
      @graph[edge[0]] << edge[1]
    else
      @graph[edge[0]] = [edge[1]]
    end

    if @rgraph.has_key?(edge[1])
      @rgraph[edge[1]] << edge[0]
    else
      @rgraph[edge[1]] = [edge[0]]
    end
    
    if @nodes.has_key?(edge[0])
    else
      @nodes[edge[0]] = edge[0]
    end

    if @nodes.has_key?(edge[1])
    else
      @nodes[edge[1]] = edge[1]
    end
  end

  #guarantee a source node can reach every other node by adding 
  #node s, length 0 for all existingnodes
  @g_prime = @rgraph.clone
  @l_prime = @lengths.clone
  @source = 0

  @nodes.each_key do |node|
    if @g_prime[node] == nil
      @g_prime[node] = [0]
    else
      @g_prime[node] << 0
    end
    @l_prime[[0,node]] = 0
  end

  @g_prime[0] = [0]
  @l_prime[[0,0]] = 0


  #run Bellman-Ford on modified graph to detect negative-cost cycles and
  #to obtain coefficients for eliminating negative edges
  budget = @nodes.size

  @nodes.each_key do |n|
    @edge_weights[n] = bellman_ford(budget, n)
  end

  #detect negative cost cycles
  @nodes.each_key do |n|
    bellman_ford(budget+1, n)
    if @solutions[[budget,n]] != @solutions[[budget+1,n]]
      raise "This graph has negative cost cycles!".inspect
    end
  end

  #transform lengths so that all edges are positive using 
  #shortest paths returned by Bellman-Ford algorithm 
  @l_trans = @lengths.clone

  @l_trans.each_pair do |nodes, cost|
    @l_trans[nodes] = cost + @edge_weights[nodes[0]] - @edge_weights[nodes[1]]
  end

  #run Dijkstra's algorithm on the positive edge length transformation of g
  #return the shortest path and node associated with that path from each 
  #iteration. untransform the path length and compare to previous shortest path
  @nodes.each_key do |source|
    node, dist = dijkstra(source)
    if dist != inf
      if dist < shortest
        shortest = dist
      end
    end
  end

  return shortest
end

def bellman_ford(budget, node)
  inf = Float::INFINITY

  if budget <= 0
    if node == @source
      0
    else
      inf
    end
  elsif @solutions[[budget,node]] != nil
    @solutions[[budget,node]]
  else
    s1 = bellman_ford(budget-1,node)
    s2 = inf

    @g_prime[node].each do |w|
      adjacent_cost = bellman_ford(budget-1,w) + @l_prime[[w,node]]
      if adjacent_cost < s2
        s2 = adjacent_cost 
      end
    end

    @solutions[[budget,node]] = [s1,s2].min
  end  
end 

def dijkstra(file_name = "test.csv", source)
  require "rubygems"
  require "algorithms"

  inf = Float::INFINITY

  @unvisited = Containers::MinHeap.new
  @runvisited = Hash.new #key = node, value = d_score
  @shortest_paths = Hash.new #key = node, value = path length

  #initialize the nodes that the sorce node points to
  if @graph[source] == nil
    return inf, inf
  else
    @graph[source].each do |node| 
      @unvisited.push(@l_trans[[source,node]],node)
      @runvisited[node] = @l_trans[[source,node]]
    end

    until @unvisited.empty? do
      path_length = @unvisited.next_key
      new_node = @unvisited.pop

      if @shortest_paths[new_node] == nil
        @shortest_paths[new_node] = path_length

        if @graph.has_key?(new_node)
          @graph[new_node].each do |node|
            if @shortest_paths[node] == nil
              d_score = path_length + @l_trans[[new_node,node]]
              if @runvisited.has_key?(node) && d_score < @runvisited[node]
                @unvisited.change_key(@runvisited[node], d_score)
                @runvisited[node] = d_score
              elsif @runvisited[node] == nil
                @unvisited.push(d_score,node)
                @runvisited[node] = d_score
              end
            end
          end
        end
      end
    end

    @shortest_paths.delete(source)

    @shortest_paths.each_pair do |node, length|
      puts "length #{length}, t1 #{@edge_weights[source]}, t2 #{@edge_weights[node]}"
      @shortest_paths[node] = length - @edge_weights[source] + @edge_weights[node]
      puts "result #{@shortest_paths[node]}"
    end

    dist = @shortest_paths.values.min
    node = @shortest_paths.key(dist)

    return node, dist
  end
end

def time
  start = Time.now
  result = johnson()
  puts "Completed in #{Time.now - start} seconds."
  result
end