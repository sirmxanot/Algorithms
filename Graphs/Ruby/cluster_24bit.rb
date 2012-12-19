def cluster_24bit(file_name="test_clustering2.csv")
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
    nodes.delete(node)
    
    neighbors, nodes = within_two(node, nodes)
    until neighbors.empty? do
      neighbor = neighbors.pop
      near, nodes = within_two(neighbor, nodes)
      neighbors.concat(near)
    end
    clusters += 1
  end
  

  return clusters
end

def within_one(node, nodes)
  close = Array.new

  node.each do |i|
    permutation = node.dup

    if permutation[i] == 0
      permutation[i] = 1
    elsif permutation[i] == 1
      permutation[i] = 0
    end

    if nodes[permutation]
     close << nodes[permutation]
     nodes.delete(permutation)
    end
  end

  return close, nodes
end

def within_two(node, nodes)
  close, nodes = within_one(node, nodes)
  near = close.dup

  close.each do |n|
    if node[n]
      close, nodes = within_one(n,nodes)
      near.concat(close)
    end  
  end


  return near, nodes
end


#   # #if you add up the sum of each row, you can filter the candidate nodes because
#   # #you will know for sure which nodes are more than 2 apart. however, you will 
#   # #not have a guarantee that the other nodes are not more than 2 apart, you will
#   # #still have to do further checking
#   nodes.each_value do |node|
#     count = 0
#     node.each_char {|b| count += b.to_i}
#     sums[nodes.key(node)] = count
#   end 

#   nodes.each do |id, value|
#     nodes.each do |comp_id, comp_value|
#       if (sums[id] - sums[comp_id]).abs < 3
#         if leaders.same?()
          
#         end
#       end
#     end
#   end


#   return nodes, sums
# end