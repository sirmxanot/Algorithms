# this is an object oriented implementation of kosaraju's algorithm for finding strongly connected components

class Kosaraju
  def initialize file
    @file         = file
    @graph        = Hash.new
    @graph_rev    = Hash.new
    @leaders      = Hash.new
    @leaders_rev  = Hash.new
    @ordering     = Hash.new
    read_file
  end

  def return_sizes_of_sccs
    determine_ordering_of_nodes.find_sccs.determine_scc_sizes
  end

  private

  def read_file
    File.open(@file).each do |line|
      node_a, node_b = line.split
      
      @graph.insert node_a, node_b
      @graph_rev.insert node_b, node_a
    end
  end

  def determine_ordering_of_nodes
    @order = 0

    reverse_natural_ordering.each do |node|
      if @ordering.has_key? node 
        @source = node
        # @graph_rev.determine_ordering_of node
      end
    end
    
    return self
  end

  def find_sccs
    
  end

  def reverse_natural_ordering
    @reverse_natural_ordering = @graph_rev.keys.reverse
  end

  # def determine_ordering_of node
  #   @leaders_rev.insert @source, node

  #   @ordering[node] = 0

  #   if self.has_key? node
  #     self[node].each do |edge|
  #       @graph_rev.determine_ordering_of edge unless @ordering.has_key? edge
  #     end
  #   end

  #   @ordering[node] = @order += 1
  # end
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