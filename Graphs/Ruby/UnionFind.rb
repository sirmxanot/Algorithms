class UnionFind 
  def initialize(array)
    @ids = Hash.new
    #array.each_index {|i| @ids[i] = [i]}
    array.each do |edge|
      @ids[edge[1]] = [edge[1]] unless @ids.has_key?(edge[1])
      @ids[edge[2]] = [edge[2]] unless @ids.has_key?(edge[2])
    end
    @changes = @ids
  end
  
  def connected?(id1,id2)
    @ids[id1] == @ids[id2]
  end

  def union(id1,id2)
      @ids[id1] = @ids[id1].concat(@ids[id2])
      
      @changes[id2].each do |id|
        @ids[id] = @ids[id1]
        @ids[id].sort!.uniq!
      end
      @changes[id1] = @changes[id1].concat([id2])
  end

  def values
    @ids.values.uniq
  end

  def all_values
    @ids.values
  end
end