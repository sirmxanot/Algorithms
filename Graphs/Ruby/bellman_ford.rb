def bellman_ford(file_name = "g1.csv", source_node = 0)
  require 'csv'

  #load source file for graph
  @nodes = Hash.new
  @lengths = Hash.new
  @graph = Hash.new
  @source = source_node

  CSV.foreach(file_name, :converters => :integer) do |edge| 
    @lengths[[edge[0],edge[1]]] = edge[2]
    if @graph.has_key?(edge[1])
      @graph[edge[1]] << edge[0]
    else
      @graph[edge[1]] = [edge[0]]
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

  budget = @nodes.length
  @g_prime = @graph
  @l_prime = @lengths

  inf = Float::INFINITY
  @solutions = Hash.new
  @shortest_paths = Hash.new

  @nodes.each_key do |n|
    @shortest_paths[n] = solution(budget, n)
  end

  return @shortest_paths
end


def solution(budget, node)
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
    s1 = solution(budget-1,node)
    s2 = inf

    @g_prime[node].each do |w|
      adjacent_cost = solution(budget-1,w) + @l_prime[[w,node]]
      if adjacent_cost < s2
        s2 = adjacent_cost 
      end
    end

    @solutions[[budget,node]] = [s1,s2].min
  end  

  #ADD NEGATIVE EDGE DETECTION

end 

def time
  start = Time.now
  result = bellman_ford()
  puts "Completed in #{Time.now - start} seconds."
  result
end