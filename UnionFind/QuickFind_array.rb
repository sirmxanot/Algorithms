class QuickFind
  #initializes a QuickFind object with an array of integers
  def initialize(integers)
    max = integers.sort.pop + 1
    @ids = Array.new(max)

    integers.each do |integer|
      @ids[integer] = integer
    end   
  end
  
  def connected?(p,q)
    @ids[p] == @ids[q]
  end
  
  def union(p,q)
    id1 = @ids[p]
    id2 = @ids[q]

    @ids.map! do |id|
      id == id1 ? id2 : id
    end
  end
end

def test
  a = QuickFind.new([1,2,3,4,5])

  a.union(1,4)
  a.union(4,5)
  puts a.connected?(1,5)
  puts a.connected?(1,2) == false
end
test