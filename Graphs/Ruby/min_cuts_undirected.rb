def min_cuts_undirected(file_name="kargerMinCut.csv")
  require "csv"
  
  graph = Hash.new 

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    graph[row[0]] = row[1..-1]
  end

  count ||= graph.flatten.count
  
  #base case
  if graph.count <= 2
    return graph, count
  else
    #while there are greater than 2 vertices remaining
    until graph.count == 2
      #choose random edge
      vertex_keep = graph.keys.sample
      vertex_delete = graph[vertex_keep].sample

      #append graph[vertex_delete] to graph[vertex_keep]
      graph[vertex_keep] += graph[vertex_delete]

      #change all edges other vertices share with 
      #vertex_delete to edges with vertex_keep
      graph[vertex_delete].each do |edge| 
        graph[edge].map! do |vertex| 
          vertex == vertex_delete ? vertex_keep : vertex
        end
      end

      #delete graph[vertex_delete]
      graph.delete(vertex_delete)
      
      #eliminate self-loops
      graph[vertex_keep].delete_if {|edge| edge == vertex_keep}
  
      #update counter
      count = graph[vertex_keep].length if graph.count == 2
    end
  end

  count
end

def time
  start = Time.now
  result = 1000

  500.times do 
    potential = min_cuts_undirected()
    result = potential unless potential > result
  end

  puts "Completed in #{Time.now - start} seconds."
  result
end