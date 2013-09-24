class UnionFind 
  def initialize(nodes)
    @leaders = Hash.new
    @leaders = nodes
    @changes = @leaders
    # array.each do |edge|
    #   @leaders[edge[1]] = [edge[1]] unless @leaders.has_key?(edge[1])
    #   @leaders[edge[2]] = [edge[2]] unless @leaders.has_key?(edge[2])
    # end
    # @changes = @leaders
  end
  
  def same?(id1,id2)
    @leaders[id1] == @leaders[id2]
  end

  def union(id1,id2)
    @leaders[id1] = @leaders[id1].concat(@leaders[id2])
    
    @changes[id2].each do |id|
      @leaders[id] = @leaders[id1]
      @leaders[id].sort!.uniq!
    end
    @changes[id1] = @changes[id1].concat([id2])
  end

  def values
    @leaders.values.uniq
  end

  def all_values
    @leaders.values
  end
end