def dijkstra(source, file_name = "test2.csv")
  require "rubygems"
  require "algorithms"

  #delete this part later
  require 'csv'
  @nodes = Hash.new
  @l_trans = Hash.new
  @graph = Hash.new
  @rgraph = Hash.new
  CSV.foreach(file_name, :converters => :integer) do |edge| 
    @l_trans[[edge[0],edge[1]]] = edge[2]
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

  @unvisited = Containers::MinHeap.new
  @runvisited = Hash.new #key = node, value = d_score
  @shortest_paths = Hash.new #key = node, value = path length

  #initialize the nodes that the sorce node points to
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

  dist = @shortest_paths.values.min
  node = @shortest_paths.key(dist)

  return node, dist
end