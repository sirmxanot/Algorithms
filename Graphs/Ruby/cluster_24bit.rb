def cluster_24bit(file_name="clustering2.csv")
  require "csv"

  nodes = Hash.new
  i ||= 0

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row|    
    if nodes.has_key?(row)
    else
      nodes[row] = row
      # values[row] = row
      # i += 1
    end
  end

  clusters = 0

  until nodes.empty? do
    node = nodes.keys.first
    #puts "delete node: #{node}"
    nodes.delete(node)
    #puts "updated hash #{nodes}"
    
    neighbors, nodes = within_two(node, nodes)
    until neighbors.empty? do
      near, nodes = within_two(neighbors.pop, nodes)
      neighbors.concat(near)
    end
    clusters += 1
  end
  

  return clusters
end

def within_one(node, nodes)
  close = Array.new
  #puts "in within_one"
  node.each_index do |i|
    permutation = node.dup
    #puts "before: #{permutation}"
    if permutation[i] == 0
      permutation[i] = 1
    elsif permutation[i] == 1
      permutation[i] = 0
    end
    #puts "permutation: #{permutation}"
    
    close << permutation
    
    #if nodes[permutation] then nodes.delete(permutation) end
    
  end
  #puts "within one output: #{close}"
  return close, nodes
end

def within_two(node, nodes)
  close, nodes = within_one(node, nodes)
  near = close.dup

  close.each do |n|
    neighbors, nodes = within_one(n,nodes)
    near.concat(neighbors)
  end

  vecinos = Array.new
  near.each do |n|
    #puts "within twos: #{n}"
    if nodes[n]
      vecinos << n
      #puts "new vecino #{n}"
      nodes.delete(n)
    end
  end

  return vecinos, nodes
end