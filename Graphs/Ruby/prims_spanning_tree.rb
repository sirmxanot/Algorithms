def prims_spanning_tree(file_name="edges.csv")
  require "csv"
  
  graph = Hash.new 

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
      if graph.has_key?(row[0])
        graph[row[0]] = graph[row[0]].push([row[2],row[1]])
      else
        graph[row[0]] = [[row[2],row[1]]]
      end

      if graph.has_key?(row[1])
        graph[row[1]] = graph[row[1]].push([row[2],row[0]])
      else
        graph[row[1]] = [[row[2],row[0]]]
      end
  end

  explored_vertices ||= [graph[1][0][1]]
  tree ||= 0

  until explored_vertices.count == graph.keys.count
    adj_edges = Array.new
    explored_vertices.each do |vertex|
      adj_edges << graph[vertex]
    end

    adj_edges = adj_edges.flatten(1)
    adj_edges.delete_if {|e| explored_vertices.include?(e[1])}
    adj_edges.sort!
    explored_vertices << adj_edges[0][1]
    tree += adj_edges[0][0]
  end

  return tree
end