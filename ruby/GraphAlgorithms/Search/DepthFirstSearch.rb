class DepthFirstSearch
  attr_accessor :explored

  def initialize(file)
    @file               = file
    @graph              = Hash.new
    @order              = 1
    @explored           = { @graph.keys.first => 0 }
    @nodes_to_explore   = [@graph.keys.first]
    read_file
  end

  def search
    until @nodes_to_explore.empty?
      explore_top_node
    end

    return @explored
  end

  def explore_top_node
    mark_top_node_explored.find_unexplored_neighbor

    if @next_neighbor.nil?
      @nodes_to_explore.pop
    else
      @nodes_to_explore.push @next_neighbor
    end
  end
  
  def mark_top_node_explored
    top_node = @nodes_to_explore.last
    
    unless @explored.has_key? top_node
      @explored[top_node] = @order
      @order += 1
    end

    return self
  end

  def find_unexplored_neighbor
    @next_neighbor = @graph[@nodes_to_explore.last].detect { |neighbor| unexplored? neighbor } 
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