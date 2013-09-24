def dijkstra(source, file_name = "test_data/dijkstraData.txt")
  require "rubygems"
  require "algorithms"
  require 'csv'

  @nodes = Hash.new
  @l_trans = Hash.new
  @graph = Hash.new

  #read in raw graph
  File.open(file_name, "r") do |file_handle|
    file_handle.each_line do |line|
      row = line.split
      tail = row.shift.to_i
      row.each do |edge|
        head,cost = edge.split(',') 
        head = head.to_i
        cost = cost.to_i

        @l_trans[[tail,head]] = cost

        if @graph.has_key?(tail)
          @graph[tail] << head
        else
          @graph[tail] = [head]
        end

        if @nodes.has_key?(tail)
        else
          @nodes[tail] = tail
        end

        if @nodes.has_key?(head)
        else
          @nodes[head] = head
        end
      end
    end
    puts "finished loading files"
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
  
  answer = [@shortest_paths[7],@shortest_paths[37],@shortest_paths[59],
    @shortest_paths[82],@shortest_paths[99],@shortest_paths[115],
    @shortest_paths[133],@shortest_paths[165],@shortest_paths[188],
    @shortest_paths[197]]

  return answer
end