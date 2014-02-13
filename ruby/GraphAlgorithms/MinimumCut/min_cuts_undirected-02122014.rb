require 'csv'

class MinCut
  def initialize(file)
    @file = file
    @graph = Hash.new  
    read_csv_file
  end

  def read_csv_file
    CSV.foreach(@file, :converters => :integer) do |row| 
      @graph[row.shift] = row
    end
  end

  def reduce_to_two_nodes
    if is_base_case
      count_and_return_cuts
    else
      pick_nodes.contract_edge.remove_self_loops.recurse
    end
  end

  def is_base_case
    @graph.length == 2
  end

  def pick_nodes
    @node_keep   = @graph.keys.sample
    @node_delete = @graph[@node_keep].sample

    return self
  end

  def contract_edge
    combine_nodes_edges.update_moved_edges.delete_node
  end

  def combine_nodes_edges
    @graph[@node_keep] += @graph[@node_delete]

    return self
  end

  def update_moved_edges
    @graph[@node_delete].each do |edge|
      delete_edge_with @graph[edge]
      add_edge_with @graph[edge]
    end

    return self 
  end

  def delete_edge_with node
    node.delete(@node_delete)
  end

  def add_edge_with node
    node.push(@node_keep) 
  end

  def delete_node
    @graph.delete(@node_delete)

    return self
  end

  def remove_self_loops
    @graph[@node_keep].delete_if {|edge| edge == @node_keep}

    return self
  end

  def recurse
    reduce_to_two_nodes
  end

  def count_and_return_cuts
    @graph[@node_keep].length
  end
end

def test
  start = Time.now
  result = 1000

  500.times do 
    potential = MinCut.new("test_data/kargerMinCut.csv").reduce_to_two_nodes
    result = potential if potential < result
  end

  puts "Completed in #{Time.now - start} seconds."
  result
end