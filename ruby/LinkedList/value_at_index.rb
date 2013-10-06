# Returns the value of the element at the given index. Negative indices indicate position from end of the linked list
require_relative 'LinkedList'

class LinkedList
  def value_at_index(index)
    list = self.clone
    element = nil

    if index < 0
      (index.abs - 1).times {list.pop}
      element = list.pop
    else
      index.times {list.shift}
      element = list.shift
    end
    #puts "element value #{element.value}"
    element ? element.value : nil
  end
end

def test
  a = [1,2,3,4,5,6]
  b = ["a","b",1,2,-3,54.5,"a","b",54.5]
  c = [0,1,2,2,1,0]
  d = []

  puts a.to_l.value_at_index(0) == a[0]
  puts a.to_l.value_at_index(-1) == a[-1]
  puts b.to_l.value_at_index(4) == b[4]
  puts b.to_l.value_at_index(-2) == b[-2]
  puts c.to_l.value_at_index(2) == c[2]
  puts c.to_l.value_at_index(-3) == c[-3]
  puts d.to_l.value_at_index(0) == d[0]
end
test