def cluster(file_name="test_data/test.csv", k = 4)
  require "csv"
  #require_relative 'UnionFind'
  
  graph = Array.new
  clusters = Hash.new
  tree ||= 0

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    graph << [row[2], row[0], row[1]]
  end

  graph.sort!

  graph.each do |edge|
    clusters[edge[1]] = [edge[1]] unless clusters.has_key?(edge[1])
    clusters[edge[2]] = [edge[2]] unless clusters.has_key?(edge[2])
  end
  

  graph.each do |node|
    puts "#{node}, #{clusters[clusters.key([node[1]])]}, #{clusters[clusters.key([node[2]])]}"
    puts "#{clusters}"
    unless clusters.key([node[1]]) == clusters.key([node[2]])
      if clusters[clusters.key([node[1]])].length > clusters[clusters.key([node[2]])].length
        clusters[clusters.key([node[1]])] = clusters[clusters.key([node[1]])].push(clusters[clusters.key([node[2]])])
        #clusters.delete(node[2])
      else
        clusters[clusters.key([node[2]])] = clusters[clusters.key([node[2]])].push(clusters[clusters.key([node[1]])])
        #clusters.delete(node[1])
      end
    end
    break if clusters.keys.length == k
  end

  # clusters.keys.each {|key| tree = graph[key][0] }

  return clusters, graph
end