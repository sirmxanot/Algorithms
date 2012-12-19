def cluster_24bit(file_name="test_clustering2.csv")
  require "csv"
  require_relative 'UnionFind'

  nodes = Hash.new
  i ||= 0

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row|    
    nodes[i] = row[0]
    i += 1
  end

  leaders = UnionFind.new(nodes)
  sums = Hash.new

  # #if you add up the sum of each row, you can filter the candidate nodes because
  # #you will know for sure which nodes are more than 2 apart. however, you will 
  # #not have a guarantee that the other nodes are not more than 2 apart, you will
  # #still have to do further checking
  nodes.each_value do |node|
    count = 0
    node.each_char {|b| count += b.to_i}
    sums[nodes.key(node)] = count
  end 

  return nodes, sums
end