class DepthFirstSearch
  attr_accessor :order

  def initialize(file)
    @file               = file
    @graph              = Hash.new
    @order              = 1
    @explored           = { @graph.keys.first => 0 }
    @nodes_to_explore   = [@graph.keys.first]
    read_file
  end

  def search
    explore_top_node.recurse_until_no_more_nodes_unexplored
  end
  
  def find_unexplored_neighbor
    unvisited = @graph[@nodes_to_explore.last].detect { |neighbor| unexplored? neighbor } 

    if unvisited

    else


    end
    
    return self
  end

  def mark_explored node
    @explored[node] = @order
    @order += 1
  end

  def find_next_unexplored_adjacent_node_to node
    @graph[node].each do |adjacent_node|
      return adjacent_node unless explored? adjacent_node
    end
  end

  def unexplored? node
    !@explored.has_key? node
  end

  private

  def read_file
    File.open(@file).each do |line|
      node_a, node_b = line.split
      
      @graph.insert node_a, node_b
    end
  end
end