class Heap 
  def initialize(graph, nodes)
    @ids = nodes
  end
  
  def connected?(id1,id2)
    @ids[id1] == @ids[id2]
  end

  def union(id1,id2)
    @ids[id1] = @ids[id1].concat(@ids[id2])
    
    nodes[id2].each do |id|
      @ids[id] = @ids[id1]
      @ids[id].sort!.uniq!
    end
    nodes[id1] = nodes[id1].concat([id2])
  end

  def values
    @ids.values.uniq
  end

  def all_values
    @ids.values
  end
end