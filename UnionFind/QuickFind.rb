class QuickFind
  #initializes a QuickFind object with ids from 0 to n
  def initialize(n)
    @ids = []
    0.upto(n-1) {|i| @ids[i] = i}
  end
  
  def connected?(id1,id2)
    @ids[id1] == @ids[id2]
  end
  
  def union(id1,id2)
    id_1, id_2 = @ids[id1], @ids[id2]
    @ids.map! {|i| (i == id_1) ? id_2 : i }
  end

  def length
    @ids.length
  end
end