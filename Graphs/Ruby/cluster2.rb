def cluster(file_name="clustering1.csv", k = 4)
  require "csv"
  require_relative 'UnionFind'
  
  graph = Array.new
  tree ||= 0

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    graph << [row[2], row[0], row[1]]
  end

  graph.sort!.reverse!
  #graph.length is not correct. you need to give it a list of all of the nodes
  clusters = UnionFind.new(graph)
  gg = clusters

  until clusters.values.length == k - 1 do
    edge = graph.pop
    puts "#{edge}"
    puts "#{clusters.connected?(edge[1],edge[2])}"

    clusters.union(edge[1],edge[2]) unless clusters.connected?(edge[1],edge[2])
    puts "#{clusters.values}"
    gg = clusters.values
    tree = edge[0]
  end

  return tree, gg
end