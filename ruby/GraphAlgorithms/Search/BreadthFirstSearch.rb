class BreadthFirstSearch
  attr_accessor :graph

  def initialize(file)
    @file               = file
    @graph              = Hash.new   
    read_file
    @explored           = { @graph.keys.first => 0 }
    @nodes_to_explore   = [@graph.keys.first]
  end

  def search
    until @nodes_to_explore.empty?
      explore_top_node
    end

    return @explored
  end

  def explore_top_node
    top_node = @nodes_to_explore.shift

    @graph[top_node].each do |neighbor|
      unless @explored.has_key? neighbor
        @explored[neighbor] = @explored[top_node] + 1 
        @nodes_to_explore << neighbor
      end
    end
  end

  private

  def read_file
    File.open(@file).each do |line|
      node_a, node_b = line.split
      
      @graph.insert node_a.to_i, node_b.to_i
    end
  end
end

class Hash
  def insert key, value
    if self.has_key? key
      self[key] << value
    else
      self[key] = [value]
    end
  end
end

def test
  bfs = BreadthFirstSearch.new('test_data/BFS.txt')
  puts bfs.search ==  { 1 => 0, 2 => 1, 3 => 1, 4 => 2, 5 => 2, 6 => 3 }
end